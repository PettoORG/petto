import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
sealed class AuthFailure with _$AuthFailure {
  const AuthFailure._();

  /// Connection problems
  const factory AuthFailure.network({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = Network;

  /// Too many attempts (rate-limit)
  const factory AuthFailure.tooManyRequests({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = TooManyRequests;

  /// Account status
  const factory AuthFailure.userDisabled({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = UserDisabled;

  /// Credentials / input
  const factory AuthFailure.invalidEmail({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = InvalidEmail;

  const factory AuthFailure.emailDoesNotExist({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = EmailDoesNotExist;

  const factory AuthFailure.weakPassword({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = WeakPassword;

  const factory AuthFailure.invalidEmailAndPasswordCombination({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = InvalidEmailAndPasswordCombination;

  const factory AuthFailure.emailInUse({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
    String? email,
  }) = EmailInUse;

  const factory AuthFailure.credentialAlreadyInUse({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = CredentialAlreadyInUse;

  const factory AuthFailure.providerAlreadyLinked({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = ProviderAlreadyLinked;

  const factory AuthFailure.userMismatch({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = UserMismatch;

  const factory AuthFailure.invalidPhoneNumber({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = InvalidPhoneNumber;

  /// Security-sensitive ops
  const factory AuthFailure.requiresRecentLogin({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = RequiresRecentLogin;

  /// User cancelled a popup / provider flow
  const factory AuthFailure.cancelledByUser({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = CancelledByUser;

  /// Configuration / project
  const factory AuthFailure.invalidRole({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = InvalidRole;

  /// Fallback
  const factory AuthFailure.unexpected({
    String? message,
    String? code,
    dynamic cause,
    StackTrace? stackTrace,
  }) = Unexpected;
}

class AuthFailureFactory {
  static AuthFailure fromFirebaseAuthException(
    FirebaseAuthException e,
    StackTrace stackTrace, {
    String email = '',
  }) {
    switch (e.code) {
      // conexión
      case 'network-request-failed':
        return AuthFailure.network(
            message: 'error.noInternetConnection'.tr(), code: e.code, cause: e, stackTrace: stackTrace);
      case 'too-many-requests':
        return AuthFailure.tooManyRequests(
            message: 'error.tooManyAttempts'.tr(), code: e.code, cause: e, stackTrace: stackTrace);

      // cuenta inhabilitada / inexistente
      case 'user-disabled':
        return AuthFailure.userDisabled(
            message: 'error.userDisabled'.tr(), code: e.code, cause: e, stackTrace: stackTrace);
      case 'user-not-found':
        return AuthFailure.emailDoesNotExist(
            message: 'error.emailDoesNotExist'.tr(), code: e.code, cause: e, stackTrace: stackTrace);

      // email / password
      case 'invalid-email':
        return AuthFailure.invalidEmail(
            message: 'error.invalidEmail'.tr(), code: e.code, cause: e, stackTrace: stackTrace);
      case 'weak-password':
        return AuthFailure.weakPassword(
            message: 'error.weakPassword'.tr(), code: e.code, cause: e, stackTrace: stackTrace);
      case 'wrong-password':
      case 'invalid-credential':
        return AuthFailure.invalidEmailAndPasswordCombination(
            message: 'error.incorrectEmailOrPassword'.tr(), code: e.code, cause: e, stackTrace: stackTrace);
      case 'email-already-exists':
      case 'email-already-in-use':
      case 'account-exists-with-different-credential':
        return AuthFailure.emailInUse(
            message: 'error.emailInUse'.tr(), code: e.code, cause: e, stackTrace: stackTrace, email: email);

      // linking / credenciales externas
      case 'credential-already-in-use':
        return AuthFailure.credentialAlreadyInUse(
            message: 'error.credentialAlreadyInUse'.tr(), code: e.code, cause: e, stackTrace: stackTrace);
      case 'provider-already-linked':
        return AuthFailure.providerAlreadyLinked(
            message: 'error.providerAlreadyLinked'.tr(), code: e.code, cause: e, stackTrace: stackTrace);
      case 'user-mismatch':
        return AuthFailure.userMismatch(
            message: 'error.userMismatch'.tr(), code: e.code, cause: e, stackTrace: stackTrace);

      // teléfono
      case 'invalid-phone-number':
        return AuthFailure.invalidPhoneNumber(
            message: 'error.invalidPhoneNumber'.tr(), code: e.code, cause: e, stackTrace: stackTrace);

      // seguridad
      case 'requires-recent-login':
        return AuthFailure.requiresRecentLogin(
            message: 'error.requiresRecentLogin'.tr(), code: e.code, cause: e, stackTrace: stackTrace);

      // configuración
      case 'operation-not-allowed':
        return AuthFailure.invalidRole(
            message: 'error.invalidRole'.tr(), code: e.code, cause: e, stackTrace: stackTrace);

      // usuario cancela
      case 'operation-cancelled':
        return AuthFailure.cancelledByUser(
            message: 'error.cancelledByUser'.tr(), code: e.code, cause: e, stackTrace: stackTrace);

      // fallback
      default:
        return AuthFailure.unexpected(
            message: 'error.unexpectedError'.tr(), code: e.code, cause: e, stackTrace: stackTrace);
    }
  }

  static AuthFailure fromException(Exception e, StackTrace stackTrace) => AuthFailure.unexpected(
      message: 'error.unexpectedError'.tr(), code: 'unexpected', cause: e, stackTrace: stackTrace);
}
