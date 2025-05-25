import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petto/core/files/application/app_file_view_model.dart';

part 'files_state.freezed.dart';

/// State for a list of files with file CRUD capabilities.
@freezed
sealed class FilesState with _$FilesState {
  const FilesState._();

  /// Loading State. Could be the initial loading or file processing.
  /// [files] holds the current list of files.
  /// [status] indicates whether this is the first load, on-hold, or processing.
  const factory FilesState.loading(
    List<AppFileViewModel> files,
    LoadingStatus status,
  ) = Loading;

  /// Loaded State. A load process has completed.
  /// [files] holds the updated list; [status] shows how it was loaded.
  const factory FilesState.loaded(
    List<AppFileViewModel> files,
    LoadedStatus status,
  ) = Loaded;
}

/// Status of a loading process.
enum LoadingStatus {
  /// Initial loading of files.
  initial,

  /// File processing is on hold while awaiting another action.
  onHold,

  /// File processing is currently in progress.
  processing,
}

/// Status of a loaded process.
enum LoadedStatus {
  /// Loaded empty, when Firestore path is null.
  fromNullPath,

  /// Loaded from database.
  fromDatabase,

  /// Loaded due to file picking or cancelling.
  fromPicking,

  /// Loaded after processing. Emits once after all files processed.
  afterProcessing,
}
