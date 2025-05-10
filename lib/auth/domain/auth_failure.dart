import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

/// Union type for all possible failures that can occur during Authentication.
/// Transforms Errors and Exceptions from the infrastructure layer into Failures
/// that can be handled in the domain layers and appwards.
///
/// Each failure has a [message] with a human readable description of the error,
/// a [code] with a unique identifier for the error, a [cause] with the original
/// error, exception or object that originated the failure and a [stackTrace]
/// with the stack trace of the error.
@freezed
sealed class AuthFailure with _$AuthFailure {
  const AuthFailure._();

  /// Represents an unexpected or not identified failure.
  const factory AuthFailure.unexpected({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = _Unexpected;

  /// Represents a network or internet connectivity failure.
  const factory AuthFailure.network({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = _NoNetworkConnection;

  /// Represents too many requests to the server failure.
  const factory AuthFailure.tooManyRequests({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = _TooManyRequests;

  /// Represents a disabled user failure.
  const factory AuthFailure.userDisabled({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = _UserDisabled;

  /// Represents an email that does not exist failure.
  const factory AuthFailure.emailDoesNotExist({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = _EmailDoesNotExist;

  /// Represents a cancelled by user failure.
  const factory AuthFailure.cancelledByUser({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = _CancelledByUser;

  /// Represents an invalid email and password combination failure.
  const factory AuthFailure.invalidEmailAndPasswordCombination({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = _InvalidEmailAndPasswordCombination;

  /// Represents an email already in use failure.
  const factory AuthFailure.emailInUse({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
    String? email,
  }) = _EmailInUse;

  /// Represents an invalid role failure.
  const factory AuthFailure.invalidRole({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = _InvalidRole;

  /// Represents an invalid phone number failure.
  const factory AuthFailure.invalidPhoneNumber({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = _InvalidPhoneNumber;
}

/// Class with static methods to create failures from FirebaseAuthException.
class AuthFailureFactory {
  /// Returns an [AuthFailure] from a FirebaseAuthException, with appropriate
  /// message and code.
  static AuthFailure fromFirebaseAuthException(FirebaseAuthException exception, StackTrace stackTrace,
      {String email = ''}) {
    final code = exception.code;
    switch (code) {
      case 'network-request-failed':
        return AuthFailure.network(
          message: 'error.noInternetConnection'.tr(),
          code: code,
          cause: exception,
          stackTrace: stackTrace,
        );
      case 'too-many-requests':
        return AuthFailure.tooManyRequests(
          message: 'error.tooManyAttempts'.tr(),
          code: code,
          cause: exception,
          stackTrace: stackTrace,
        );
      case 'user-disabled':
        return AuthFailure.userDisabled(
          message: 'error.userDisabled'.tr(),
          code: code,
          cause: exception,
          stackTrace: stackTrace,
        );
      case 'user-not-found':
        return AuthFailure.emailDoesNotExist(
          message: 'error.emailDoesNotExist'.tr(),
          code: code,
          cause: exception,
          stackTrace: stackTrace,
        );
      case 'wrong-password':
      case 'invalid-credential':
        return AuthFailure.invalidEmailAndPasswordCombination(
          message: 'error.incorrectEmailOrPassword'.tr(),
          code: code,
          cause: exception,
          stackTrace: stackTrace,
        );
      case 'email-already-exists':
      case 'email-already-in-use':
      case 'account-exists-with-different-credential':
        return AuthFailure.emailInUse(
          message: 'error.emailInUse'.tr(),
          code: code,
          cause: exception,
          stackTrace: stackTrace,
          email: email,
        );
      case 'invalid-phone-number':
        return AuthFailure.invalidPhoneNumber(
          message: 'error.invalidPhoneNumber'.tr(),
          code: code,
          cause: exception,
          stackTrace: stackTrace,
        );
      case 'operation-not-allowed':
        return AuthFailure.invalidRole(
          message: 'error.invalidRole'.tr(),
          code: code,
          cause: exception,
          stackTrace: stackTrace,
        );
      case 'operation-cancelled':
        return AuthFailure.cancelledByUser(
          message: 'error.cancelledByUser'.tr(),
          code: code,
          cause: exception,
          stackTrace: stackTrace,
        );
      default:
        return AuthFailure.unexpected(
          message: 'error.unexpectedError'.tr(),
          code: code,
          cause: exception,
          stackTrace: stackTrace,
        );
    }
  }

  /// Returns an [AuthFailure.unexpected] from any Exception, with appropriate
  /// message and code.
  static AuthFailure fromException(Exception exception, StackTrace stackTrace) {
    return AuthFailure.unexpected(
      message: 'error.unexpectedError'.tr(),
      code: 'unexpected',
      cause: exception,
      stackTrace: stackTrace,
    );
  }
}
