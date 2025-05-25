import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:petto/core/domain/failure.dart';
import 'package:petto/core/files/application/app_file_view_model.dart';
import 'package:petto/core/files/application/files_firestore_path_provider.dart';
import 'package:petto/core/files/application/files_state.dart';
import 'package:petto/core/files/domain/app_file.dart';
import 'package:petto/core/files/domain/crop_options.dart';
import 'package:petto/core/files/shared/providers.dart';
import 'package:petto/core/infrastructure/log.dart';
import 'package:petto/core/shared/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rxdart/rxdart.dart';

part 'files_notifier.g.dart';

@riverpod
class FilesNotifier extends _$FilesNotifier {
  FirebaseCrashlytics get crashlytics => ref.read(crashlyticsProvider);

  /// List of Stream subscriptions to dispose when no longer needed.
  final List<StreamSubscription> sbs = [];

  /// List of UploadTasks subscriptions to dispose when no longer needed.
  final List<StreamSubscription<TaskSnapshot>> tasks = [];

  /// BehaviorSubject used to pause the File List Stream to avoid unwanted 'data' states.
  final pauseStream = BehaviorSubject<bool>.seeded(false);

  /// Saves the provider "family" to reuse it later.
  @override
  late String family;

  /// Getter to check if there are any files pending to be deleted or uploaded.
  bool get hasFilesPending => state.files
      .where(
        (f) =>
            f.status == AppFileStatus.delete ||
            f.status == AppFileStatus.upload ||
            f.status == AppFileStatus.deleteFailed ||
            f.status == AppFileStatus.uploadFailed,
      )
      .isNotEmpty;

  @override
  FilesState build(String family) {
    this.family = family;
    final collectionPath = ref.watch(filesFirestorePathProvider(family));

    // If there's no valid collection path, return an empty array with fromNullPath status.
    if (collectionPath == null) {
      return const FilesState.loaded([], LoadedStatus.fromNullPath);
    }

    final fileFirestoreRepository = ref.read(fileFirestoreRepositoryProvider(family: family));
    final query = ref.watch(appFileQueryProvider(family: family));

    // Listen to the Firestore repository stream.
    sbs.add(
      CombineLatestStream.combine2<Either<Failure, List<AppFile>>, bool, Either<Failure, List<AppFile>>?>(
        fileFirestoreRepository.streamQuery(query),
        pauseStream.asBroadcastStream(),
        (failureOrFiles, isPaused) => isPaused == false ? failureOrFiles : null,
      ).listen(
        (failureOrFiles) {
          // If null is received, it's assumed that the stream is paused, so skip the update.
          if (failureOrFiles == null) return;

          failureOrFiles.fold(
            (failure) {
              fail(failure);
            },
            (files) {
              if (files.isEmpty) {
                state = FilesState.loaded(
                  [],
                  LoadedStatus.fromDatabase,
                );
                return;
              }
              _patchWholeState(files);
            },
          );
        },
      ),
    );

    ref.onDispose(() {
      // Dispose all subscriptions when the provider is destroyed.
      for (final s in sbs) {
        s.cancel();
      }
      sbs.clear();

      for (final t in tasks) {
        t.cancel();
      }
      tasks.clear();
      pauseStream.close();
    });

    // Initial loading state while waiting for the streams.
    return const FilesState.loading([], LoadingStatus.initial);
  }

  /// Updates the entire state when new data is received from the stream.
  /// Ensures that the state is updated efficiently and consistently.
  void _patchWholeState(List<AppFile> incomingFiles) {
    // Create a map to quickly find existing files by their ID.
    final existingFilesMap = {
      for (var fileVM in state.files) fileVM.file.id ?? fileVM.file.hashCode.toString(): fileVM
    };
    final updatedFiles = <AppFileViewModel>[];

    // For each file coming from Firestore, merge or create a new AppFileViewModel.
    for (final incomingFile in incomingFiles) {
      final key = incomingFile.id!;
      final existingFileVM = existingFilesMap.remove(key);
      if (existingFileVM != null) {
        // If the file already exists in state, update it.
        final updatedFileVM = existingFileVM.copyWith(file: incomingFile);
        updatedFiles.add(updatedFileVM);
      } else {
        // Otherwise, create a brand new AppFileViewModel.
        updatedFiles.add(AppFileViewModel(
          file: incomingFile,
          status: AppFileStatus.idle,
          pickedFile: null,
          progress: null,
          failure: null,
        ));
      }
    }

    // Add remaining files that didn't exist in Firestore (e.g., not yet uploaded).
    updatedFiles.addAll(existingFilesMap.values);

    // Sort the updated files:
    // 1. Move 'delete' status files to the end
    // 2. Then, sort by createdAt desc
    updatedFiles.sort((a, b) {
      if (a.status == AppFileStatus.delete && b.status != AppFileStatus.delete) {
        return 1;
      } else if (a.status != AppFileStatus.delete && b.status == AppFileStatus.delete) {
        return -1;
      } else {
        return b.file.createdAt!.compareTo(a.file.createdAt!);
      }
    });

    state = FilesState.loaded(updatedFiles, LoadedStatus.fromDatabase);
  }

  /// Takes a picture with the camera.
  /// If [cropOptions] is provided, a crop dialog will be shown.
  /// [allowedMimes] is an optional list of allowed mime types.
  Future<void> pickImageFromCamera({
    CropOptions? cropOptions,
    List<String>? allowedMimes,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) async {
    final fileRepository = ref.read(fileStorageRepositoryProvider(family));
    final failureOrFile = await fileRepository.pickImageFromCamera(
      cropOptions: cropOptions,
      allowedMimes: allowedMimes,
      preferredCameraDevice: preferredCameraDevice,
    );

    failureOrFile.fold(
      (failure) {
        fail(failure);
      },
      (file) async {
        if (file == null) {
          Log.i('Image selection operation cancelled by user.');
          return;
        }

        final newFile = AppFileViewModel(
          file: AppFile.empty().copyWith(
            mime: _getMimeType(file.path) ?? '',
            createdAt: DateTime.now(),
          ),
          pickedFile: file,
          status: AppFileStatus.upload,
          progress: null,
          failure: null,
        );

        state = FilesState.loaded(
          [newFile, ...state.files],
          LoadedStatus.fromPicking,
        );
      },
    );
  }

  /// Picks an image from the gallery.
  /// If [cropOptions] is provided, a crop dialog will be shown.
  /// [allowedMimes] is an optional list of allowed mime types.
  Future<void> pickImageFromGallery({
    CropOptions? cropOptions,
    List<String>? allowedMimes,
  }) async {
    final fileRepository = ref.read(fileStorageRepositoryProvider(family));
    final failureOrFile = await fileRepository.pickImageFromGallery(
      allowedMimes: allowedMimes,
      cropConfig: cropOptions,
    );

    failureOrFile.fold(
      (failure) {
        fail(failure);
      },
      (file) async {
        if (file == null) {
          Log.i('Image selection operation cancelled or not allowed.');
          return;
        }

        // Add the selected image to the state
        final newFile = AppFileViewModel(
          file: AppFile.empty().copyWith(
            mime: _getMimeType(file.path) ?? '',
            createdAt: DateTime.now(),
          ),
          pickedFile: file,
          status: AppFileStatus.upload,
          progress: null,
          failure: null,
        );

        state = FilesState.loaded(
          [newFile, ...state.files],
          LoadedStatus.fromPicking,
        );
      },
    );
  }

  /// Picks multiple images from the gallery.
  /// [cropOptions] is optional to crop each image.
  /// [allowedMimes] is an optional list of allowed mime types.
  /// [limit] is the maximum number of images allowed.
  Future<void> pickImagesFromGallery({
    CropOptions? cropOptions,
    List<String>? allowedMimes,
    int? limit,
  }) async {
    final fileRepository = ref.read(fileStorageRepositoryProvider(family));
    final failureOrFiles = await fileRepository.pickImagesFromGallery(
      cropConfig: cropOptions,
      allowedMimes: allowedMimes,
      limit: limit,
    );

    failureOrFiles.fold(
      (failure) {
        fail(failure);
      },
      (files) async {
        if (files == null || files.isEmpty) {
          // User cancelled operation or there are no valid images, handle as needed
          Log.i('Multiple image selection operation cancelled or no valid images.');
          return;
        }

        // Add each selected image to the state
        final updatedFiles = [...state.files];
        for (final file in files) {
          final newFile = AppFileViewModel(
            file: AppFile.empty().copyWith(
              mime: _getMimeType(file.path) ?? '',
              createdAt: DateTime.now(),
            ),
            pickedFile: file,
            status: AppFileStatus.upload,
            progress: null,
            failure: null,
          );

          updatedFiles.insert(0, newFile);
        }

        state = FilesState.loaded(updatedFiles, LoadedStatus.fromPicking);
      },
    );
  }

  /// Takes a video using the camera.
  /// [allowedMimes] is an optional list of allowed mime types.
  /// [preferredCameraDevice] can be rear or front camera.
  /// [maxDuration] is the maximum length for the video.
  Future<void> pickVideoFromCamera({
    List<String>? allowedMimes,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
    Duration maxDuration = const Duration(seconds: 60),
  }) async {
    final fileRepository = ref.read(fileStorageRepositoryProvider(family));

    final failureOrFile = await fileRepository.pickVideoFromCamera(
      allowedMimes: allowedMimes,
      preferredCameraDevice: preferredCameraDevice,
      maxDuration: maxDuration,
    );

    failureOrFile.fold(
      (failure) {
        fail(failure);
      },
      (file) async {
        if (file == null) {
          Log.i('Video capture cancelled by user.');
          return;
        }

        final newFile = AppFileViewModel(
          file: AppFile.empty().copyWith(
            mime: _getMimeType(file.path) ?? '',
            createdAt: DateTime.now(),
          ),
          pickedFile: file,
          status: AppFileStatus.upload,
          progress: null,
          failure: null,
        );

        state = FilesState.loaded(
          [newFile, ...state.files],
          LoadedStatus.fromPicking,
        );
      },
    );
  }

  /// Picks a video from the gallery.
  /// [allowedMimes] is an optional list of allowed mime types.
  /// [maxDuration] is the maximum length for the video.
  Future<void> pickVideoFromGallery({
    List<String>? allowedMimes,
    Duration maxDuration = const Duration(seconds: 60),
  }) async {
    final fileRepository = ref.read(fileStorageRepositoryProvider(family));
    final failureOrFile = await fileRepository.pickVideoFromGallery(
      allowedMimes: allowedMimes,
      maxDuration: maxDuration,
    );

    failureOrFile.fold(
      (failure) {
        fail(failure);
      },
      (file) async {
        if (file == null) {
          Log.i('Video selection cancelled by user or not allowed.');
          return;
        }

        final newFile = AppFileViewModel(
          file: AppFile.empty().copyWith(
            mime: _getMimeType(file.path) ?? '',
            createdAt: DateTime.now(),
          ),
          pickedFile: file,
          status: AppFileStatus.upload,
          progress: null,
          failure: null,
        );

        state = FilesState.loaded(
          [newFile, ...state.files],
          LoadedStatus.fromPicking,
        );
      },
    );
  }

  /// Picks a single media (image or video) from the gallery.
  /// [allowedMimes] is an optional list of allowed mime types.
  /// [cropOptions] is used if the selected media is an image.
  Future<void> pickMediaFromGallery({
    List<String>? allowedMimes,
    CropOptions? cropOptions,
  }) async {
    final fileRepository = ref.read(fileStorageRepositoryProvider(family));
    final failureOrFile = await fileRepository.pickMediaFromGallery(
      allowedMimes: allowedMimes,
      cropOptions: cropOptions,
    );

    failureOrFile.fold(
      (failure) {
        fail(failure);
      },
      (file) async {
        if (file == null) {
          Log.i('Media selection cancelled by user or not allowed.');
          return;
        }

        final newFile = AppFileViewModel(
          file: AppFile.empty().copyWith(
            mime: _getMimeType(file.path) ?? '',
            createdAt: DateTime.now(),
          ),
          pickedFile: file,
          status: AppFileStatus.upload,
          progress: null,
          failure: null,
        );

        state = FilesState.loaded(
          [newFile, ...state.files],
          LoadedStatus.fromPicking,
        );
      },
    );
  }

  /// Picks multiple media (images and/or videos) from the gallery.
  /// [allowedMimes] is an optional list of allowed mime types.
  Future<void> pickMultipleMediaFromGallery({
    List<String>? allowedMimes,
  }) async {
    final fileRepository = ref.read(fileStorageRepositoryProvider(family));
    final failureOrFiles = await fileRepository.pickMultipleMediaFromGallery(
      allowedMimes: allowedMimes,
    );

    failureOrFiles.fold(
      (failure) {
        fail(failure);
      },
      (files) async {
        if (files == null || files.isEmpty) {
          Log.i('Multiple media selection cancelled or no valid files.');
          return;
        }

        final updatedFiles = [...state.files];
        for (final file in files) {
          final newFile = AppFileViewModel(
            file: AppFile.empty().copyWith(
              mime: _getMimeType(file.path) ?? '',
              createdAt: DateTime.now(),
            ),
            pickedFile: file,
            status: AppFileStatus.upload,
            progress: null,
            failure: null,
          );
          updatedFiles.insert(0, newFile);
        }

        state = FilesState.loaded(updatedFiles, LoadedStatus.fromPicking);
      },
    );
  }

  /// Cancels an ongoing operation (upload or delete).
  /// If it's a new file being uploaded, remove it from state.
  /// If it's a file marked for deletion, reset its status to 'idle'.
  void cancelOperation(AppFileViewModel fileViewModel) {
    if (pauseStream.value != true) pauseStream.add(true);

    final fileIndex = state.files.indexWhere((f) => f.file.id == fileViewModel.file.id);
    if (fileIndex < 0 || fileIndex >= state.files.length) return;

    if (fileViewModel.status == AppFileStatus.upload) {
      // If it's a new file being uploaded, remove it from the state
      final updatedFiles = [...state.files]..removeAt(fileIndex);
      state = FilesState.loaded(updatedFiles, LoadedStatus.fromPicking);
    } else if (fileViewModel.status == AppFileStatus.delete) {
      // If it's a file marked for deletion, reset its status to idle
      _patchFileInState(
        fileIndex,
        status: AppFileStatus.idle,
      );
    }

    if (pauseStream.value != false) pauseStream.add(false);
  }

  /// Retries the operation (upload or delete) for a file that previously failed.
  /// If it was uploadFailed, reset status to 'upload'. If it was deleteFailed, reset to 'delete'.
  void retryOperation(AppFileViewModel fileViewModel) {
    if (pauseStream.value != true) pauseStream.add(true);

    final fileIndex = state.files.indexWhere((f) => f.file.id == fileViewModel.file.id);
    if (fileIndex < 0 || fileIndex >= state.files.length) return;

    if (fileViewModel.status == AppFileStatus.uploadFailed) {
      // Reset the status to 'upload' to retry uploading
      _patchFileInState(
        fileIndex,
        status: AppFileStatus.upload,
      );
    } else if (fileViewModel.status == AppFileStatus.deleteFailed) {
      // Reset the status to 'delete' to retry deletion
      _patchFileInState(
        fileIndex,
        status: AppFileStatus.delete,
      );
    }
    if (pauseStream.value != false) pauseStream.add(false);
  }

  /// Marks a file for deletion.
  void deleteFile(AppFileViewModel fileViewModel) {
    final fileIndex = state.files.indexWhere((f) => f.file.id == fileViewModel.file.id);
    if (fileIndex < 0 || fileIndex >= state.files.length) return;

    _patchFileInState(
      fileIndex,
      status: AppFileStatus.delete,
    );
  }

  /// Processes files that need uploading or deleting.
  /// If a file's mime starts with 'video/', it will be uploaded to api.video.
  /// If it's an image, it will be uploaded to Firebase Storage.
  /// [hold] indicates if the process should be paused before starting.
  /// [files] is an optional list of files to add to the state before processing.
  Future<void> processFiles({
    bool hold = false,
    List<AppFileViewModel> files = const [],
  }) async {
    // Add any incoming files to the state.
    if (files.isNotEmpty) {
      state = state.copyWith(files: [...state.files, ...files]);
    }

    // Identify files that need to be uploaded (id == '0').
    final filesToUpload =
        state.files.where((file) => file.status == AppFileStatus.upload && file.file.id == '0').toList();

    // Identify files that need to be deleted (id != '0').
    final filesToDelete =
        state.files.where((file) => file.status == AppFileStatus.delete && file.file.id != '0').toList();

    // If there's nothing to process, return early.
    if (filesToUpload.isEmpty && filesToDelete.isEmpty) return;

    // If there's no Firestore path, we put the status on hold and do nothing else.
    if (hold || ref.read(filesFirestorePathProvider(family)) == null) {
      state = FilesState.loading(state.files, LoadingStatus.onHold);
      return;
    }

    // Pause the stream to avoid concurrency issues.
    if (pauseStream.value != true) pauseStream.add(true);

    // Update the state to "processing".
    state = FilesState.loading(state.files, LoadingStatus.processing);

    // Reference to the FileStorageRepository.
    final fileRepository = ref.read(fileStorageRepositoryProvider(family));

    // Handle file uploads.
    for (var fileViewModel in filesToUpload) {
      // Find the index of the current file in the state.
      final fileIndex = state.files.indexOf(fileViewModel);

      if (fileIndex == -1) {
        // If the file is not found in the state, skip processing.
        Log.e('File not found in state: ${fileViewModel.file.id}');
        continue;
      }
      final uploadTask = fileRepository.uploadFile(fileViewModel.pickedFile!);

      final taskSubscription = uploadTask.snapshotEvents.listen(
        (snapshot) async {
          switch (snapshot.state) {
            case TaskState.running:
              final progress = (100 * snapshot.bytesTransferred / snapshot.totalBytes).floor();
              _patchFileInState(fileIndex, progress: progress);
              break;

            case TaskState.success:
              final downloadUrl = await snapshot.ref.getDownloadURL();
              final newFile = fileViewModel.file.copyWith(
                name: fileViewModel.pickedFile!.path.split(Platform.pathSeparator).last,
                url: downloadUrl,
                path: snapshot.ref.fullPath,
              );

              final failureOrCreatedId =
                  await ref.read(fileFirestoreRepositoryProvider(family: family)).create(newFile);

              failureOrCreatedId.fold(
                (failure) => _patchFileInState(
                  fileIndex,
                  status: AppFileStatus.uploadFailed,
                  failure: failure,
                  progress: null,
                ),
                (id) => _patchFileInState(
                  fileIndex,
                  status: AppFileStatus.uploaded,
                  file: newFile.copyWith(id: id, url: newFile.url),
                  progress: 100,
                ),
              );

              _checkProcessingFinished();
              break;

            case TaskState.canceled:
              _patchFileInState(
                fileIndex,
                status: AppFileStatus.uploadFailed,
                failure: const Failure.storage(),
                progress: 0,
              );
              _checkProcessingFinished();
              break;

            case TaskState.error:
              // Handled in onError.
              break;

            default:
              break;
          }
        },
        onError: (e, stackTrace) {
          final failure = e is FirebaseException
              ? FailureFactory.fromStorageException(e, stackTrace)
              : Failure.storage(cause: e, stackTrace: stackTrace);

          _patchFileInState(
            fileIndex,
            status: AppFileStatus.uploadFailed,
            failure: failure,
            progress: 0,
          );

          _checkProcessingFinished();
          fail(failure);
        },
      );
      sbs.add(taskSubscription);
    }

    // Handle file deletions.
    for (var fileViewModel in filesToDelete) {
      final fileIndex = state.files.indexOf(fileViewModel);
      if (fileIndex == -1) {
        Log.e('File not found in state for deletion: ${fileViewModel.file.id}');
        _checkProcessingFinished();
        continue;
      }

      // Start the delete task and handle the result using fold.
      final failureOrDeleted =
          await ref.read(fileFirestoreRepositoryProvider(family: family)).delete(fileViewModel.file.id!);
      failureOrDeleted.fold(
        (failure) {
          _patchFileInState(
            fileIndex,
            status: AppFileStatus.deleteFailed,
            failure: failure,
          );
        },
        (_) => _patchFileInState(
          fileIndex,
          status: AppFileStatus.deleted,
        ),
      );
    }

    // Double-check in case there was nothing to upload or delete.
    _checkProcessingFinished();
  }

  /// Checks if all files in state have completed processing (no more 'upload' or 'delete').
  /// If none are pending, transitions to 'LoadedStatus.afterProcessing'.
  void _checkProcessingFinished() {
    // Determine the new state based on the current state and the actions performed
    final processingFiles = state.files
        .where((file) => file.status == AppFileStatus.upload || file.status == AppFileStatus.delete)
        .toList();

    if (processingFiles.isEmpty) {
      final resultingState = [...state.files].where((file) => file.status != AppFileStatus.deleted).toList();

      state = FilesState.loaded(resultingState, LoadedStatus.afterProcessing);

      if (!pauseStream.isClosed) {
        pauseStream.add(false);
      }

      // Cancel all task subscriptions.
      for (final t in tasks) {
        t.cancel();
      }
      tasks.clear();
    }
  }

  /// Updates the timestamp (createdAt) of the given file to make it the "main" image.
  /// If file status is 'upload', just updates it locally (no DB).
  /// If file status is 'idle' or 'uploaded', updates it in Firestore.
  void setMainImage(AppFileViewModel fileViewModel) async {
    final fileIndex = state.files.indexWhere((f) => f.file.id == fileViewModel.file.id);
    if (fileIndex == -1) return;

    if (fileViewModel.status == AppFileStatus.upload) {
      // Update locally
      _patchFileInState(
        fileIndex,
        file: fileViewModel.file.copyWith(createdAt: DateTime.now()),
      );
      return;
    }

    // Check the status of the file
    if (fileViewModel.status != AppFileStatus.idle && fileViewModel.status != AppFileStatus.uploaded) {
      // Cannot update database if status is not 'idle' or 'uploaded'
      return;
    }

    final newTimestamp = DateTime.now();
    final updatedFile = fileViewModel.file.copyWith(createdAt: newTimestamp);

    // Update the file in Firestore
    final failureOrSuccess = await ref.read(fileFirestoreRepositoryProvider(family: family)).update(
          updatedFile.id!,
          updatedFile,
        );

    failureOrSuccess.fold(
      (failure) => fail(failure),
      (_) {},
    );
  }

  /// Helper method to get MIME type from file extension.
  String? _getMimeType(String path) {
    return lookupMimeType(path);
  }

  /// Logs a Failure to console and records it in Crashlytics.
  void fail(Failure failure) {
    Log.e(
      failure.message,
      exception: failure.cause,
      stackTrace: failure.stackTrace,
    );
    crashlytics.recordError(failure.cause, failure.stackTrace);
  }

  /// Patches a file in state based on the given index [i].
  /// Allows updating file data, status, progress, etc.
  void _patchFileInState(
    int i, {
    AppFile? file,
    AppFileStatus? status,
    File? pickedFile,
    int? progress,
    Failure? failure,
  }) {
    final currentFile = state.files[i];
    final updatedFile = currentFile.copyWith(
      file: file ?? currentFile.file,
      status: status ?? currentFile.status,
      pickedFile: pickedFile ?? currentFile.pickedFile,
      progress: progress ?? currentFile.progress,
      failure: failure ?? currentFile.failure,
    );

    final updatedFiles = [...state.files];
    updatedFiles[i] = updatedFile;

    // Sort again to keep consistency
    updatedFiles.sort((a, b) {
      if (a.status == AppFileStatus.delete && b.status != AppFileStatus.delete) {
        return 1;
      } else if (a.status != AppFileStatus.delete && b.status == AppFileStatus.delete) {
        return -1;
      } else {
        return b.file.createdAt!.compareTo(a.file.createdAt!);
      }
    });

    // Update the state, preserving the loading/loaded branch via pattern matching.
    state = switch (state) {
      // If we're in Loading, reemit with the same status
      Loading(files: _, status: final status) => FilesState.loading(updatedFiles, status),

      // If we're in Loaded, ajustar el status según convenga
      Loaded(files: _, status: final status) => FilesState.loaded(
          updatedFiles,
          status == LoadedStatus.afterProcessing ? LoadedStatus.fromPicking : status,
        ),
    };
  }
}
