import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/auth/infrastructure/auth_repository.dart';
import 'package:petto/users/shared/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:petto/users/domain/user.dart' as app_user;

part 'providers.g.dart';

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(Ref ref) => FirebaseAuth.instance;

@Riverpod(keepAlive: true)
GoogleSignIn googleSignIn(Ref ref) => GoogleSignIn();

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) => AuthRepository(
      ref.watch(firebaseAuthProvider),
      ref.watch(googleSignInProvider),
      ref.watch(userFirestoreRepositoryProvider),
    );

/// Provider for authenticated User. This provider is intended to be used only
/// after authentication was performed. If used before, it will throw an error.
@Riverpod(keepAlive: true)
Stream<app_user.User> user(Ref ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges().map(
    (user) {
      if (user == null) {
        throw Exception('userProvider should only be used after authentication was performed. Do not use it before!');
      }
      return user;
    },
  );
}
