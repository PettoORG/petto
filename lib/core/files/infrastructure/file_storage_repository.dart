import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:petto/core/domain/failure.dart';
import 'package:petto/core/files/domain/crop_options.dart';
import 'package:image_picker_android/image_picker_android.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:uuid/uuid.dart';

/// Class that provides available file operations in a folder and its files.
/// FileRepository sees only ONE folder at a time, the one provided by the
/// [storagePath] parameter.
class FileStorageRepository {
  /// Firebase Storage Bucket where operations are performed. Null if default
  /// bucket is used.
  final String? bucket;

  /// Firebase Storage instance.
  final FirebaseStorage storage;

  /// Path where operations are performed.
  final String? storagePath;

  final ImagePicker _picker = ImagePicker();

  FileStorageRepository({
    required this.bucket,
    required this.storage,
    required this.storagePath,
  });

  /// Takes a picture with the camera.
  ///
  /// If [cropConfig] is provided, the user will be shown the crop dialog.
  ///
  /// [allowedMimes] is a list of allowed mime types.
  /// [preferredCameraDevice] is the preferred camera device to take the picture.
  Future<Either<Failure, File?>> pickImageFromCamera({
    CropOptions? cropOptions,
    List<String>? allowedMimes,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) async {
    try {
      // Pick image from camera
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: preferredCameraDevice,
      );

      // If the user does not select any image, return Right(null)
      if (pickedFile == null) {
        return right(null);
      }

      // Check the MIME type if allowedMimes is provided
      if (allowedMimes != null && allowedMimes.isNotEmpty) {
        final mimeType = _getMimeType(pickedFile.path);
        if (mimeType == null || !allowedMimes.contains(mimeType)) {
          return left(
            Failure.storage(
              message: 'formValidator.fileTypeNotAllowed'.tr(namedArgs: {
                'extencions': allowedMimes.join(', '),
              }),
            ),
          );
        }
      }

      File imageFile = File(pickedFile.path);

      // If cropping is enabled and cropConfig is given, crop the image
      if (cropOptions != null) {
        final Either<Failure, CroppedFile?> croppedResult = await _cropImage(imageFile.path, cropOptions);

        return croppedResult.fold(
          (failure) => left(failure),
          (croppedFile) {
            // If the crop was cancelled, return Right(null)
            if (croppedFile == null) {
              return right(null);
            }
            return right(File(croppedFile.path));
          },
        );
      }

      return right(imageFile);
    } on Exception catch (e, st) {
      return left(Failure.storage(message: 'error.pickImage'.plural(1), cause: e, stackTrace: st));
    }
  }

  /// Picks several images from the gallery. [allowedMimes] is a list of allowed
  /// mime types. [limit] is the maximum number of images that can be selected.
  /// If [cropConfig] is provided, the user will be shown the crop dialog.
  Future<Either<Failure, List<File>?>> pickImagesFromGallery({
    List<String>? allowedMimes,
    int? limit,
    CropOptions? cropConfig,
  }) async {
    try {
      // Set useAndroidPhotoPicker to true
      final ImagePickerPlatform imagePickerImplementation = ImagePickerPlatform.instance;
      if (imagePickerImplementation is ImagePickerAndroid) {
        imagePickerImplementation.useAndroidPhotoPicker = true;
      }
      // Pick multiple images from gallery
      final List<XFile> pickedFiles = await _picker.pickMultiImage(
        limit: limit,
      );

      // If the user does not select any image, return Right(null)
      if (pickedFiles.isEmpty) {
        return right(null);
      }

      // Apply filter by MIME types if allowedMimes is provided
      if (allowedMimes != null && allowedMimes.isNotEmpty) {
        for (var file in pickedFiles) {
          final mimeType = _getMimeType(file.path);
          if (mimeType == null || !allowedMimes.contains(mimeType)) {
            return left(
              Failure.storage(
                message: 'formValidator.fileTypeNotAllowed'.tr(namedArgs: {
                  'extencions': allowedMimes.join(', '),
                }),
              ),
            );
          }
        }
      }

      // Convert XFile to File
      List<File> imageFiles = pickedFiles.map((xfile) => File(xfile.path)).toList();

      // If cropping is enabled and cropConfig is provided, crop each image
      if (cropConfig != null) {
        List<File> croppedFiles = [];
        for (var file in imageFiles) {
          final Either<Failure, CroppedFile?> croppedResult = await _cropImage(file.path, cropConfig);

          final croppedFile = croppedResult.fold(
            (failure) => throw Exception(failure.message),
            (cropped) => cropped,
          );

          // If cropping was cancelled, skip this image
          if (croppedFile != null) {
            croppedFiles.add(File(croppedFile.path));
          }
        }
        imageFiles = croppedFiles;

        // If all images were cropped, return Right(null)
        if (imageFiles.isEmpty) {
          return right(null);
        }
      }

      return right(imageFiles);
    } on Exception catch (e, st) {
      return left(Failure.storage(message: 'error.pickImage'.plural(2), cause: e, stackTrace: st));
    }
  }

  /// Select a single image from the gallery.
  ///
  /// If [cropConfig] is provided, the crop dialog will be shown to the user.
  ///
  /// [allowedMimes] is a list of allowed MIME types.
  Future<Either<Failure, File?>> pickImageFromGallery({
    List<String>? allowedMimes,
    CropOptions? cropConfig,
  }) async {
    try {
      // Select an image from the gallery
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );

      // If the user does not select any image, return Right(null)
      if (pickedFile == null) {
        return right(null);
      }

      // Check the MIME type if allowedMimes is provided
      if (allowedMimes != null && allowedMimes.isNotEmpty) {
        final mimeType = _getMimeType(pickedFile.path);
        if (mimeType == null || !allowedMimes.contains(mimeType)) {
          return left(
            Failure.storage(
              message: 'formValidator.fileTypeNotAllowed'.tr(namedArgs: {
                'extencions': allowedMimes.join(', '),
              }),
            ),
          );
        }
      }

      File imageFile = File(pickedFile.path);

      // If cropping is enabled and cropConfig is provided, crop the image
      if (cropConfig != null) {
        final Either<Failure, CroppedFile?> croppedResult = await _cropImage(imageFile.path, cropConfig);

        return croppedResult.fold(
          (failure) => left(failure),
          (croppedFile) {
            // If the crop was cancelled, return Right(null)
            if (croppedFile == null) {
              return right(null);
            }
            return right(File(croppedFile.path));
          },
        );
      }

      return right(imageFile);
    } on Exception catch (e, st) {
      return left(Failure.storage(message: 'error.pickImage'.plural(1), cause: e, stackTrace: st));
    }
  }

  /// Takes a video with the camera.
  ///
  /// [allowedMimes] is a list of allowed MIME types.
  /// [preferredCameraDevice] is the preferred camera device to capture the video.
  Future<Either<Failure, File?>> pickVideoFromCamera({
    List<String>? allowedMimes,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
    Duration maxDuration = const Duration(seconds: 60),
  }) async {
    try {
      // Capture video from camera
      final XFile? pickedFile = await _picker.pickVideo(
        source: ImageSource.camera,
        preferredCameraDevice: preferredCameraDevice,
        maxDuration: maxDuration,
      );

      // If the user does not capture any video, return Right(null)
      if (pickedFile == null) {
        return right(null);
      }

      // Check the MIME type if allowedMimes is provided
      if (allowedMimes != null && allowedMimes.isNotEmpty) {
        final mimeType = _getMimeType(pickedFile.path);
        if (mimeType == null || !allowedMimes.contains(mimeType)) {
          return left(
            Failure.storage(
              message: 'formValidator.fileTypeNotAllowed'.tr(namedArgs: {
                'extensions': allowedMimes.join(', '),
              }),
            ),
          );
        }
      }

      File videoFile = File(pickedFile.path);
      return right(videoFile);
    } on Exception catch (e, st) {
      return left(Failure.storage(
        message: 'error.pickVideo'.plural(1),
        cause: e,
        stackTrace: st,
      ));
    }
  }

  /// Selects a single video from the gallery.
  ///
  /// [allowedMimes] is a list of allowed MIME types.
  Future<Either<Failure, File?>> pickVideoFromGallery({
    List<String>? allowedMimes,
    Duration maxDuration = const Duration(seconds: 60),
  }) async {
    try {
      // Select a video from the gallery
      final XFile? pickedFile = await _picker.pickVideo(source: ImageSource.gallery, maxDuration: maxDuration);

      // If the user does not select any video, return Right(null)
      if (pickedFile == null) {
        return right(null);
      }

      // Check the MIME type if allowedMimes is provided
      if (allowedMimes != null && allowedMimes.isNotEmpty) {
        final mimeType = _getMimeType(pickedFile.path);
        if (mimeType == null || !allowedMimes.contains(mimeType)) {
          return left(
            Failure.storage(
              message: 'formValidator.fileTypeNotAllowed'.tr(namedArgs: {
                'extensions': allowedMimes.join(', '),
              }),
            ),
          );
        }
      }

      File videoFile = File(pickedFile.path);
      return right(videoFile);
    } on Exception catch (e, st) {
      return left(Failure.storage(
        message: 'error.pickVideo'.plural(1),
        cause: e,
        stackTrace: st,
      ));
    }
  }

  /// Selects either an image or a video from the gallery based on [mediaType].
  ///
  /// [mediaType] specifies whether to pick an image or a video.
  /// [allowedMimes] is a list of allowed MIME types.
  /// [cropOptions] is used to crop the image if necessary.
  Future<Either<Failure, File?>> pickMediaFromGallery({
    List<String>? allowedMimes,
    CropOptions? cropOptions,
  }) async {
    try {
      // Pick media from gallery
      final XFile? pickedFile = await _picker.pickMedia();

      // If the user does not select any media, return Right(null)
      if (pickedFile == null) {
        return right(null);
      }

      // Check the MIME type if allowedMimes is provided
      if (allowedMimes != null && allowedMimes.isNotEmpty) {
        final mimeType = _getMimeType(pickedFile.path);
        if (mimeType == null || !allowedMimes.contains(mimeType)) {
          return left(
            Failure.storage(
              message: 'formValidator.fileTypeNotAllowed'.tr(namedArgs: {
                'extensions': allowedMimes.join(', '),
              }),
            ),
          );
        }
      }

      File mediaFile = File(pickedFile.path);

      // If the picked media is an image and cropping is enabled, crop the image
      if (_isImage(mediaFile.path) && cropOptions != null) {
        final Either<Failure, CroppedFile?> croppedResult = await _cropImage(mediaFile.path, cropOptions);

        return croppedResult.fold(
          (failure) => left(failure),
          (croppedFile) {
            // If the crop was cancelled, return Right(null)
            if (croppedFile == null) {
              return right(null);
            }
            return right(File(croppedFile.path));
          },
        );
      }

      return right(mediaFile);
    } on Exception catch (e, st) {
      return left(Failure.storage(
        cause: e,
        stackTrace: st,
      ));
    }
  }

  /// Selects multiple media (images and/or videos) from the gallery.
  ///
  /// [allowedMimes] is a list of allowed MIME types.
  /// This method handles both images and videos.
  Future<Either<Failure, List<File>?>> pickMultipleMediaFromGallery({
    List<String>? allowedMimes,
  }) async {
    try {
      // Pick multiple media from gallery
      final List<XFile> pickedFiles = await _picker.pickMultipleMedia();

      // If the user does not select any media, return Right(null)
      if (pickedFiles.isEmpty) {
        return right(null);
      }

      // Apply filter by MIME types if allowedMimes is provided
      if (allowedMimes != null && allowedMimes.isNotEmpty) {
        for (var file in pickedFiles) {
          final mimeType = _getMimeType(file.path);
          if (mimeType == null || !allowedMimes.contains(mimeType)) {
            return left(
              Failure.storage(
                message: 'formValidator.fileTypeNotAllowed'.tr(namedArgs: {
                  'extensions': allowedMimes.join(', '),
                }),
              ),
            );
          }
        }
      }

      // Convert XFile to File
      List<File> mediaFiles = pickedFiles.map((xfile) => File(xfile.path)).toList();
      return right(mediaFiles);
    } on Exception catch (e, st) {
      return left(Failure.storage(
        message: 'error.pickMultipleMedia'.tr(),
        cause: e,
        stackTrace: st,
      ));
    }
  }

  /// Helper method to crop an image based on CropConfig
  Future<Either<Failure, CroppedFile?>> _cropImage(String sourcePath, CropOptions config) async {
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: sourcePath,
        aspectRatio: config.aspectRatio,
        maxWidth: config.maxWidth,
        maxHeight: config.maxHeight,
        compressQuality: config.compressQuality,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: config.title,
            cropStyle: config.cropStyle,
            initAspectRatio: config.initAspectRatio,
            lockAspectRatio: config.lockAspectRatio,
            hideBottomControls: config.hideBottomControls,
          ),
          IOSUiSettings(
            title: config.title,
            cropStyle: config.cropStyle,
            aspectRatioLockEnabled: config.lockAspectRatio,
          ),
        ],
      );
      return right(croppedFile);
    } on Exception catch (e, st) {
      return left(Failure.storage(message: 'error.cropImage'.tr(), cause: e, stackTrace: st));
    }
  }

  /// Returns an UploadTask from a File. Set [storagePath] if you want to
  /// store the file in a different location.
  UploadTask uploadFile(File file) {
    final uniqueName = _uniqueFileName(file.path);
    final ref = storage.ref('$storagePath/$uniqueName');
    return ref.putFile(file);
  }

  /// Lists all files in a directory and returns a Future with a Failure
  /// or a list of file References.
  Future<Either<Failure, List<Reference>>> listFiles() async {
    try {
      final ref = storage.ref(storagePath);
      final result = await ref.listAll();
      return right(result.items);
    } on FirebaseException catch (e, st) {
      return left(FailureFactory.fromStorageException(e, st));
    } on Exception catch (e, st) {
      return left(FailureFactory.fromException(e, st));
    }
  }

  /// Deletes a file and returns a Future with a Failure or Unit, given [fileName]
  /// without the rest of the path.
  Future<Either<Failure, Unit>> deleteFile(String fileName) async {
    try {
      final ref = storage.ref('$storagePath/$fileName');
      await ref.delete();
      return right(unit);
    } on FirebaseException catch (e, st) {
      return left(FailureFactory.fromStorageException(e, st));
    } on Exception catch (e, st) {
      return left(FailureFactory.fromException(e, st));
    }
  }

  /// Deletes all files in a directory and returns a Future with "a Failure or Unit".
  Future<Either<Failure, Unit>> deleteAllFiles() async {
    try {
      final ref = storage.ref(storagePath);
      final result = await ref.listAll();
      await Future.wait(result.items.map((item) => item.delete()).toList());
      return right(unit);
    } on FirebaseException catch (e, st) {
      return left(FailureFactory.fromStorageException(e, st));
    } on Exception catch (e, st) {
      return left(FailureFactory.fromException(e, st));
    }
  }

  /// Generates a unique file name based on uuid library.
  String _uniqueFileName(String path) {
    final fileName = Uuid().v4();
    final extension = _fileNameAndExtension(path)[1];
    return '$fileName$extension';
  }

  /// Returns an array where the first element is the file name without extension
  /// and the second element is the extension.
  List<String> _fileNameAndExtension(String path) {
    final fileName = path.split(Platform.pathSeparator).last;
    final extensionIndex = fileName.lastIndexOf('.');

    if (extensionIndex == -1) {
      return [fileName, ''];
    }

    final extension = fileName.substring(extensionIndex);
    final fileNameWithoutExtension = fileName.substring(0, extensionIndex);

    return [fileNameWithoutExtension, extension];
  }

  /// Helper method to get MIME type from file extension
  String? _getMimeType(String path) {
    return lookupMimeType(path);
  }

  /// Helper method to determine if the file is an image based on its MIME type.
  bool _isImage(String path) {
    final mimeType = _getMimeType(path);
    return mimeType != null && mimeType.startsWith('image/');
  }
}
