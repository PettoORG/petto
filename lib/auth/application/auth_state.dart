import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petto/auth/domain/auth_failure.dart';
import 'package:petto/users/domain/user.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const AuthState._();

  /// The initial state (e.g., splash screen or idle)
  const factory AuthState.initial() = Initial;

  /// Loading state (e.g., during network requests)
  const factory AuthState.loading() = Loading;

  /// Authenticated state carrying the [User] data
  const factory AuthState.authenticated(User user) = Authenticated;

  /// Unauthenticated state
  const factory AuthState.unauthenticated() = Unauthenticated;

  /// Failure state carrying the [AuthFailure]
  const factory AuthState.failure(AuthFailure failure) = FailureState;
}
