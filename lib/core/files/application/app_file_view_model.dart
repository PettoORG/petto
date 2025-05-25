import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petto/core/domain/failure.dart';
import 'package:petto/core/files/domain/app_file.dart';

part 'app_file_view_model.freezed.dart';

/// Describes a File tha has to be
@freezed
sealed class AppFileViewModel with _$AppFileViewModel {
  const AppFileViewModel._();

  const factory AppFileViewModel({
    /// AppFile object with all the information about the file.
    required AppFile file,

    /// Status of the file. It allows to determine what action should be performed
    /// on the file.
    required AppFileStatus status,

    /// Contains the file to be uploaded. Status should be "upload". It will be
    /// null for any other status.
    required File? pickedFile,

    /// Upload task progress from 0 - 100. Null if the File is not being uploaded.
    required int? progress,

    /// If File processing failed, this field will contain a Failure.
    required Failure? failure,
  }) = _AppFileViewModel;
}

/// Enum with possible statuses of a File. It allows to determine what action should
/// be performed on the file and if that action was performed successfully.
/// has to be uploaded or deleted and if those actions have been performed successfully.
enum AppFileStatus {
  /// Indicates that not action has to be perfomed on the file. This is the default
  /// status for an existing file o for a file loaded from database or storage.
  idle,

  /// Indicates that the file has to be uploaded.
  upload,

  /// Indicates that the file has been successfully uploaded.
  uploaded,

  /// Indicates that the upload of the file has failed.
  uploadFailed,

  /// Indicates that the file has to be deleted.
  delete,

  /// Indicates that the file has been successfully deleted.
  deleted,

  /// Indicates that de delete of the file has failed.
  deleteFailed,
}
