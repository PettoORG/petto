import 'dart:async';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:petto/auth/application/auth_state.dart';
import 'package:petto/auth/domain/auth_failure.dart';
import 'package:petto/auth/infrastructure/auth_repository.dart';
import 'package:petto/auth/shared/providers.dart';
import 'package:petto/core/infrastructure/log.dart';
import 'package:petto/core/shared/providers.dart';
import 'package:petto/users/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  /// List with Subscriptions
  final List<StreamSubscription> sbs = [];

  /// Getter (boolean) with current internet connection status.
  bool? get internetConnection => ref.read(internetConnectionProvider).valueOrNull;

  /// Instance of AuthRepository.
  AuthRepository get authRepository => ref.watch(authRepositoryProvider);

  /// Instance of Firebase Crashlytics.
  FirebaseCrashlytics get crashlytics => ref.read(crashlyticsProvider);

  @override
  AuthState build() {
    /// Subscribe to AuthStateChanges (User) from Repository.
    sbs.add(
      authRepository.authStateChanges().listen(
        (User? user) {
          if (user != null) {
            ref.listen(
              userProvider,
              (previous, next) {
                next.maybeWhen(
                  data: (User data) {
                    state = AuthState.authenticated(user);
                  },
                  orElse: () {},
                );
              },
            );
          } else {
            state = const AuthState.unauthenticated();
          }
        },
      ),
    );

    /// Default method to dispose all subscriptions added to sbs list.
    ref.onDispose(() async {
      for (final sb in sbs) {
        await sb.cancel();
      }
    });

    /// Set a loading state while waiting for data from Stream.
    return const AuthState.loading();
  }

  /// Sign in user with email and password.
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    state = const AuthState.loading();
    if (internetConnection != true) {
      fail(const AuthFailure.network());
      return;
    }

    final authRepository = ref.read(authRepositoryProvider);
    final failureOrSuccess = await authRepository.signInWithEmailAndPassword(email, password);
    failureOrSuccess.fold(
      (failure) => fail(failure),
      (r) {}, // Do not update state. AuthStateChanges will do it.
    );
  }

  /// Register user with email and password.
  Future<void> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    state = const AuthState.loading();
    if (internetConnection != true) {
      fail(const AuthFailure.network());
      return;
    }

    final authRepository = ref.read(authRepositoryProvider);
    final failureOrSuccess = await authRepository.registerWithEmailAndPassword(email, password);
    failureOrSuccess.fold(
      (failure) => fail(failure),
      (r) {}, // Do not update state. AuthStateChanges will do it.
    );
  }

  Future<void> signInWithGoogle() async {
    state = const AuthState.loading();
    if (internetConnection != true) {
      fail(const AuthFailure.network());
      return;
    }

    final authRepository = ref.read(authRepositoryProvider);
    final failureOrSuccess = await authRepository.signInWithGoogle();
    failureOrSuccess.fold(
      (failure) => fail(failure),
      (r) async {}, // Do not update state. AuthStateChanges will do it.
    );
  }

  // Future<void> signInWithFacebook() async {
  //   state = const AuthState.loading();
  //   if (internetConnection != true) {
  //     fail(const AuthFailure.network());
  //     return;
  //   }

  //   final authRepository = ref.read(authRepositoryProvider);
  //   final failureOrSuccess = await authRepository.signInWithFacebook();
  //   failureOrSuccess.fold(
  //     (failure) => fail(failure),
  //     (r) {}, // Do not update state. AuthStateChanges will do it.
  //   );
  // }

  /// Send password reset email.
  Future<void> sendPasswordResetEmail(String email) async {
    state = const AuthState.loading();
    if (internetConnection != true) {
      fail(const AuthFailure.network());
      return;
    }

    final failureOrSuccess = await authRepository.sendPasswordResetEmail(email);
    failureOrSuccess.fold(
      (failure) => fail(failure),
      (r) => state = const AuthState.initial(),
    );
  }

  /// Send email verification.
  Future<void> sendEmailVerification() async {
    state = const AuthState.loading();
    if (internetConnection != true) {
      fail(const AuthFailure.network());
      return;
    }

    // Create instance of AuthRepository from Provider.
    final authRepository = ref.read(authRepositoryProvider);

    // Send email verification .
    final failureOrSuccess = await authRepository.sendEmailVerification();

    // Handle failure or success.
    failureOrSuccess.fold(
      (failure) => fail(failure),
      (r) => state = const AuthState.initial(),
    );
  }

  /// Update display name.
  Future<void> updateDisplayName(String displayName) async {
    state = const AuthState.loading();
    final failureOrSuccess = await authRepository.updateDisplayName(displayName);
    failureOrSuccess.fold(
      (failure) => state = AuthState.failure(failure),
      (r) {},
    );
  }

  /// Sign out user.
  Future<void> signOut() async {
    final authRepository = ref.read(authRepositoryProvider);
    await authRepository.signOut();
  }

  Future<bool> checkEmailVerified() async {
    final authRepository = ref.read(authRepositoryProvider);
    final failureOrSuccess = await authRepository.checkEmailVerified();

    return await failureOrSuccess.fold(
      (failure) {
        fail(failure);
        return false;
      },
      (isEmailVerified) => isEmailVerified,
    );
  }

  /// Link the current user's account with Google credentials.
  Future<void> linkWithGoogle() async {
    state = const AuthState.loading();
    if (internetConnection != true) {
      fail(const AuthFailure.network());
      return;
    }
    final authRepository = ref.read(authRepositoryProvider);
    final failureOrSuccess = await authRepository.linkWithGoogle();
    failureOrSuccess.fold(
      (failure) => fail(failure),
      (r) {
        // ref.read(appPreferencesNotifierProvider.notifier).setPendingAccountLinkingEmail(null);
      },
    );
  }

  /// Link the current user's account with Google credentials.
  Future<void> linkWithPassword(String email, String password) async {
    state = const AuthState.loading();
    if (internetConnection != true) {
      fail(const AuthFailure.network());
      return;
    }
    final authRepository = ref.read(authRepositoryProvider);
    final failureOrSuccess = await authRepository.linkWithPassword(email, password);
    failureOrSuccess.fold(
      (failure) => fail(failure),
      (r) {
        // ref.read(appPreferencesNotifierProvider.notifier).setPendingAccountLinkingEmail(null);
      },
    );
  }

  // /// Link the current user's account with Facebook credentials.
  // Future<void> linkWithFacebook() async {
  //   state = const AuthState.loading();
  //   if (internetConnection != true) {
  //     fail(const AuthFailure.network());
  //     return;
  //   }
  //   final authRepository = ref.read(authRepositoryProvider);
  //   final failureOrSuccess = await authRepository.linkWithFacebook();
  //   failureOrSuccess.fold(
  //     (failure) => fail(failure),
  //     (r) {
  //       ref.read(appPreferencesNotifierProvider.notifier).setPendingAccountLinkingEmail(null);
  //     },
  //   );
  // }

  List<String>? getUserAuthProviders() {
    final authRepository = ref.read(authRepositoryProvider);
    final failureOrSuccess = authRepository.getUserAuthProviders();

    return failureOrSuccess.fold(
      (failure) {
        fail(failure);
        return null;
      },
      (providers) {
        return providers;
      },
    );
  }

  /// Given a [AuthFailure] object, log Failure to console, register error in
  /// Crashalytics and updates the state with Failure.
  void fail(AuthFailure failure) {
    /// Log error into console (only in dev).
    Log.e(
      failure.message,
      exception: failure.cause,
      stackTrace: failure.stackTrace,
    );

    /// Log error into Firebase Crashlytics.
    crashlytics.recordError(failure.cause, failure.stackTrace);

    /// Update the state with the Failure.
    state = AuthState.failure(failure);
  }
}
