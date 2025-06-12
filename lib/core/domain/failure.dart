import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Union type for all possible failures that can occur in the application.
/// Transforms Errors and Exceptions from the infrastructure layer into Failures
/// that can be handled in the domain layers and appwards.
///
/// Each failure has a [message] with a human readable description of the error,
/// a [code] with a unique identifier for the error, a [cause] with the original
/// error, exception or object that originated the failure and a [stackTrace]
/// with the stack trace of the error.
@freezed
sealed class Failure with _$Failure {
  const Failure._();

  /// Represents a failure during a crud operation with Firestore.
  const factory Failure.firestore({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = Firestore;

  /// Represents a failure during a file crud operation with Storage.
  const factory Failure.storage({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = Storage;

  /// Represents an unexpected or not identified failure.
  const factory Failure.unexpected({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = Unexpected;

  /// Represents a network or internet connectivity failure.
  const factory Failure.network({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = Network;

  /// Represents an error comming from the UI/Validations.
  const factory Failure.validation({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = Validation;
}

/// Class with static methods to create failures from exceptions.
class FailureFactory {
  /// Returns a [Failure.firestore] from a FirebaseException, with appropiated
  /// message and code.
  static Failure fromFirebaseException(
    FirebaseException exception,
    StackTrace stackTrace,
  ) {
    final message = switch (exception.code) {
      'cancelled' => 'error.operationCancelled'.tr(),
      'unknown' => 'error.unexpectedError'.tr(),
      'invalid-argument' => 'error.invalidArgument'.tr(),
      'deadline-exceeded' => 'error.timeoutExpired'.tr(),
      'not-found' => 'error.recordNotFound'.tr(),
      'already-exists' => 'error.recordExists'.tr(),
      'permission-denied' => 'error.noPermission'.tr(),
      'resource-exhausted' => 'error.quotaExceeded'.tr(),
      'failed-precondition' => 'error.preconditionFailed'.tr(),
      'aborted' => 'error.operationInterrupted'.tr(),
      'out-of-range' => 'error.outOfRangeOperation'.tr(),
      'unimplemented' => 'error.operationNotImplemented'.tr(),
      'internal' => 'error.internalUnknownError'.tr(),
      'unavailable' => 'error.serviceUnavailable'.tr(),
      'data-loss' => 'error.internalUnknownError'.tr(),
      'unauthenticated' => 'error.noPermission'.tr(),
      _ => 'error.unexpectedError'.tr(),
    };

    return Failure.firestore(
      message: message,
      code: exception.code,
      cause: exception,
      stackTrace: stackTrace,
    );
  }

  /// Returns a [Failure.storage] from a FirebaseException, with appropiated
  /// message and code.
  static Failure fromStorageException(
    FirebaseException exception,
    StackTrace stackTrace,
  ) {
    final message = switch (exception.code) {
      'storage/unknown' => 'error.unexpectedError'.tr(),
      'storage/object-not-found' => 'error.storageObjectNotFound'.tr(),
      'storage/bucket-not-found' => 'error.storageBucketNotFound'.tr(),
      'storage/project-not-found' => 'error.storageProjectNotFound'.tr(),
      'storage/quota-exceeded' => 'error.storageQuotaExceeded'.tr(),
      'storage/unauthenticated' => 'error.unauthenticated'.tr(),
      'storage/unauthorized' => 'error.noPermission'.tr(),
      'storage/retry-limit-exceeded' => 'error.retryLimitExceeded'.tr(),
      'storage/invalid-checksum' => 'error.storageInvalidChecksum'.tr(),
      'storage/canceled' => 'error.operationCancelled'.tr(),
      'storage/invalid-event-name' => 'error.storageInvalidEventName'.tr(),
      'storage/invalid-url' => 'error.storageInvalidUrl'.tr(),
      'storage/invalid-argument' => 'error.invalidArgument'.tr(),
      'storage/no-default-bucket' => 'error.storageBucketNotFound'.tr(),
      'storage/cannot-slice-blob' => 'error.storageCannotSliceBlob'.tr(),
      'storage/server-file-wrong-size' => 'error.storageServerFileWrongSize'.tr(),
      _ => 'error.unexpectedError'.tr(),
    };

    return Failure.storage(
      message: message,
      code: exception.code,
      cause: exception,
      stackTrace: stackTrace,
    );
  }

  /// Returns a [Failure.unexpected] from any Exception, with appropiated
  /// message and code.
  static Failure fromException(Exception exception, StackTrace stackTrace) {
    const message = 'Ha ocurrido un error inesperado';
    return Failure.unexpected(
      message: message,
      code: 'unexpected',
      cause: exception,
      stackTrace: stackTrace,
    );
  }
}
