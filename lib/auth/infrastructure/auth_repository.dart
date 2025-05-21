import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:petto/auth/domain/auth_failure.dart';
import 'package:petto/users/domain/user.dart' as app_user;
import 'package:petto/users/infrastructure/user_firestore_repository.dart';
import 'package:rxdart/rxdart.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final UserFirestoreRepository _userRepository;

  /// Behaviorsubject to pause the auth state Stream to avoid multiple 'data'
  /// emissions during write operations.
  final pauseStream = BehaviorSubject<bool>.seeded(false);

  AuthRepository(
    this._firebaseAuth,
    this._googleSignIn,
    this._userRepository,
  );

  /// Returns a Stream with authenticated User or null if not authenticated.
  /// The stream is paused while [pauseStream] is true to prevent emitting
  /// an auth state before the document is created.
  Stream<app_user.User?> authStateChanges() {
    return Rx.combineLatest2<User?, bool, MapEntry<User?, bool>>(
      _firebaseAuth.authStateChanges(),
      pauseStream,
      (firebaseUser, paused) => MapEntry(firebaseUser, paused),
    )
        // Only forward events when not paused
        .where((entry) => !entry.value)
        .switchMap((entry) {
      final firebaseUser = entry.key;
      return firebaseUser == null
          ? Stream.value(null)
          : _userRepository.stream(firebaseUser.uid).map(
                (event) => event.fold(
                  (l) => null,
                  (r) => r,
                ),
              );
    });
  }

  /// Private getter for current authenticated User.
  User? get _currentUser => _firebaseAuth.currentUser;

  /// Register user with email and password.
  Future<Either<AuthFailure, UserCredential>> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      // Pause the stream during the creation operation.
      pauseStream.add(true);

      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final emptyUser = app_user.User.empty();
      await _userRepository.create(
        emptyUser.copyWith(
          email: email,
          id: credentials.user!.uid,
          uid: credentials.user!.uid,
        ),
      );

      // Resume the stream after the document is created.
      pauseStream.add(false);

      return right(credentials);
    } on FirebaseAuthException catch (e, st) {
      // Resume in case of any error, so the stream won't stay paused.
      pauseStream.add(false);
      return left(AuthFailureFactory.fromFirebaseAuthException(e, st, email: e.email ?? email));
    } on Exception catch (e, st) {
      pauseStream.add(false);
      return left(AuthFailureFactory.fromException(e, st));
    }
  }

  /// Sign in user with email and password.
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(unit);
    } on FirebaseAuthException catch (e, st) {
      return left(AuthFailureFactory.fromFirebaseAuthException(e, st, email: e.email ?? email));
    } on Exception catch (e, st) {
      return left(AuthFailureFactory.fromException(e, st));
    }
  }

  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      // Pause the stream during the creation operation.
      pauseStream.add(true);

      final signInAccount = await _googleSignIn.signIn();

      if (signInAccount != null) {
        final authentication = await signInAccount.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: authentication.idToken,
          accessToken: authentication.accessToken,
        );
        final userCredential = await _firebaseAuth.signInWithCredential(credential);

        final firebaseUser = userCredential.user;

        // Handle null user case
        if (firebaseUser == null) {
          return left(AuthFailure.unexpected());
        }

        // Check if user document already exists using the repository
        final existsResult = await _userRepository.existsById(firebaseUser.uid);

        if (existsResult.isLeft()) {
          // Resume the stream before returning error
          pauseStream.add(false);
          return left(AuthFailure.unexpected());
        }

        final exists = existsResult.getOrElse(() => false);

        if (!exists) {
          final newUser = app_user.User.empty().copyWith(
            email: firebaseUser.email!,
            id: firebaseUser.uid,
            uid: firebaseUser.uid,
          );
          await _userRepository.create(
            newUser.copyWith(emailVerified: firebaseUser.emailVerified),
          );
        }

        // Resume the stream after the document is created.
        pauseStream.add(false);

        return right(unit);
      }

      return left(const AuthFailure.cancelledByUser());
    } on FirebaseAuthException catch (e, st) {
      // Resume the stream after the document is created.
      pauseStream.add(false);
      return left(AuthFailureFactory.fromFirebaseAuthException(e, st));
    } on Exception catch (e, st) {
      // Resume the stream after the document is created.
      pauseStream.add(false);
      return left(AuthFailureFactory.fromException(e, st));
    }
  }

  // /// Sign in user with Facebook.
  // Future<Either<AuthFailure, Unit>> signInWithFacebook() async {
  //   try {
  //     // Pause the stream during the creation operation.
  //     pauseStream.add(true);

  //     // Start the Facebook sign-in flow
  //     final LoginResult loginResult = await _facebookAuth.login();

  //     // Validate that the access token is not null, throw exception if null
  //     final AccessToken? accessToken = loginResult.accessToken;
  //     if (accessToken == null) {
  //       return left(AuthFailure.unexpected());
  //     }

  //     // Create Facebook credentials for Firebase
  //     final OAuthCredential credential = FacebookAuthProvider.credential(accessToken.tokenString);

  //     // Log in to Firebase with Facebook credentials
  //     final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);

  //     final firebaseUser = userCredential.user;

  //     // Handle null user case
  //     if (firebaseUser == null) {
  //       return left(AuthFailure.unexpected());
  //     }

  //     // Call the ExistingUserValidation cloud function to check if the user exists in Firestore
  //     final callable = FirebaseFunctions.instance.httpsCallable('ExistingUserValidation');
  //     final response = await callable.call();
  //     final data = response.data as Map<String, dynamic>;

  //     // If the user doesn't exist in Firestore, create a new user
  //     if (data['success'] == true && data['exists'] == false) {
  //       final newUser = app_user.User.empty().copyWith(
  //         email: firebaseUser.email!,
  //         id: firebaseUser.uid,
  //         uid: firebaseUser.uid,
  //       );
  //       await _userRepository.create(newUser);
  //     }

  //     // Resume the stream after the document is created.
  //     pauseStream.add(false);

  //     return right(unit);
  //   } on FirebaseAuthException catch (e, st) {
  //     // Resume the stream after the document is created.
  //     pauseStream.add(false);
  //     return left(AuthFailureFactory.fromFirebaseAuthException(e, st));
  //   } on Exception catch (e, st) {
  //     // Resume the stream after the document is created.
  //     pauseStream.add(false);
  //     return left(AuthFailureFactory.fromException(e, st));
  //   }
  // }

  /// Sign out user.
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      //
    }
  }

  /// Send email verification.
  Future<Either<AuthFailure, bool>> isUserEmailVerified() async {
    try {
      await _currentUser!.reload();
      return right(_currentUser!.emailVerified);
    } on FirebaseAuthException catch (e, st) {
      return left(AuthFailureFactory.fromFirebaseAuthException(e, st));
    } on Exception catch (e, st) {
      return left(AuthFailureFactory.fromException(e, st));
    }
  }

  /// Send verification email.
  Future<Either<AuthFailure, Unit>> sendEmailVerification() async {
    try {
      await _currentUser!.sendEmailVerification();
      return right(unit);
    } on FirebaseAuthException catch (e, st) {
      return left(AuthFailureFactory.fromFirebaseAuthException(e, st));
    } on Exception catch (e, st) {
      return left(AuthFailureFactory.fromException(e, st));
    }
  }

  /// Send password reset email.
  Future<Either<AuthFailure, Unit>> sendPasswordResetEmail(
    String email,
  ) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return right(unit);
    } on FirebaseAuthException catch (e, st) {
      return left(AuthFailureFactory.fromFirebaseAuthException(e, st));
    } on Exception catch (e, st) {
      return left(AuthFailureFactory.fromException(e, st));
    }
  }

  // /// Update the user's phone number.
  // Future<Either<AuthFailure, Unit>> updatePhoneNumber(
  //   PhoneAuthCredential credential,
  // ) async {
  //   try {
  //     // Update the phone number in Firebase Auth
  //     await _currentUser!.updatePhoneNumber(credential);

  //     // Fetch the user from Firestore
  //     final userResult = await _userRepository.fetch(_currentUser!.uid);

  //     // Retrieve the user or throw an unexpected failure if not found
  //     final user = userResult.getOrElse(() => throw AuthFailure.unexpected());

  //     // Update the user in Firestore with the new phone number
  //     await _userRepository.update(user.uid, user.copyWith(phoneNumber: _currentUser!.phoneNumber!));

  //     // Return success
  //     return right(unit);
  //   } on FirebaseAuthException catch (e, st) {
  //     // Handle Firebase-specific authentication exceptions
  //     return left(AuthFailureFactory.fromFirebaseAuthException(e, st));
  //   } on Exception catch (e, st) {
  //     // Handle any other exceptions
  //     return left(AuthFailureFactory.fromException(e, st));
  //   }
  // }

  /// Update the user's display name.
  Future<Either<AuthFailure, Unit>> updateDisplayName(
    String displayName,
  ) async {
    try {
      await _currentUser!.updateDisplayName(displayName);

      // Fetch the user from Firestore
      final user = await _userRepository.fetch(_currentUser!.uid);

      // Retrieve the user or throw an unexpected failure if not found
      final updatedUser = user.getOrElse(() => throw AuthFailure.unexpected());

      // Update the user in Firestore with the displayName
      await _userRepository.update(updatedUser.uid, updatedUser.copyWith(displayName: displayName));

      return right(unit);
    } on FirebaseAuthException catch (e, st) {
      return left(AuthFailureFactory.fromFirebaseAuthException(e, st));
    } on Exception catch (e, st) {
      return left(AuthFailureFactory.fromException(e, st));
    }
  }

  /// Update the user's password.
  Future<Either<AuthFailure, Unit>> updatePassword(
    String newPassword,
  ) async {
    try {
      await _currentUser!.updatePassword(newPassword);
      return right(unit);
    } on FirebaseAuthException catch (e, st) {
      return left(AuthFailureFactory.fromFirebaseAuthException(e, st));
    } on Exception catch (e, st) {
      return left(AuthFailureFactory.fromException(e, st));
    }
  }

  /// Update the user's email.
  Future<Either<AuthFailure, Unit>> updateEmail(
    String newEmail,
  ) async {
    try {
      // Verify the new email before updating it.
      await _currentUser!.verifyBeforeUpdateEmail(newEmail);

      // get the user from the database.
      final userResult = await _userRepository.fetch(_currentUser!.uid);

      // Update the user's email.
      final user = userResult.getOrElse(() => throw AuthFailure.unexpected());
      await _userRepository.update(user.uid, user.copyWith(email: newEmail));

      return right(unit);
    } on FirebaseAuthException catch (e, st) {
      return left(AuthFailureFactory.fromFirebaseAuthException(e, st));
    } on Exception catch (e, st) {
      return left(AuthFailureFactory.fromException(e, st));
    }
  }

  /// Reauthenticate the user with the password for sensitive operations.
  Future<Either<AuthFailure, Unit>> reauthenticateWithPassword(
    String password,
  ) async {
    try {
      await _currentUser!.reauthenticateWithCredential(
        EmailAuthProvider.credential(email: _currentUser!.email!, password: password),
      );
      return right(unit);
    } on FirebaseAuthException catch (e, st) {
      return left(AuthFailureFactory.fromFirebaseAuthException(e, st));
    } on Exception catch (e, st) {
      return left(AuthFailureFactory.fromException(e, st));
    }
  }

  /// Delete the authenticated user's account.
  Future<Either<AuthFailure, Unit>> deleteAccount() async {
    try {
      await _currentUser!.delete();
      return right(unit);
    } on FirebaseAuthException catch (e, st) {
      return left(AuthFailureFactory.fromFirebaseAuthException(e, st));
    } on Exception catch (e, st) {
      return left(AuthFailureFactory.fromException(e, st));
    }
  }

  /// Check if the user's email is verified.
  Future<Either<AuthFailure, bool>> checkEmailVerified() async {
    try {
      await _currentUser!.reload();
      // Fetch the user from Firestore
      final userResult = await _userRepository.fetch(_currentUser!.uid);

      // Retrieve the user or throw an unexpected failure if not found
      final user = userResult.getOrElse(() => throw AuthFailure.unexpected());

      if (user.emailVerified != _currentUser!.emailVerified) {
        // Update the user in Firestore with the emailVerified flag
        await _userRepository.update(user.id, user.copyWith(emailVerified: _currentUser!.emailVerified));
      }

      // Return success
      return right(_currentUser!.emailVerified);
    } on FirebaseAuthException catch (e, st) {
      return left(AuthFailureFactory.fromFirebaseAuthException(e, st));
    } on Exception catch (e, st) {
      return left(AuthFailureFactory.fromException(e, st));
    }
  }

  Future<Either<AuthFailure, Unit>> linkWithPassword(String email, String password) async {
    try {
      // Link with email and password if not already linked
      final currentUser = _firebaseAuth.currentUser!;

      final emailCredential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await currentUser.linkWithCredential(emailCredential);

      await checkEmailVerified();

      return right(unit);
    } on FirebaseAuthException catch (e, st) {
      return left(AuthFailureFactory.fromFirebaseAuthException(e, st));
    } on Exception catch (e, st) {
      return left(AuthFailureFactory.fromException(e, st));
    }
  }

  /// Link the current user's account with Google credentials.
  Future<Either<AuthFailure, Unit>> linkWithGoogle() async {
    try {
      // Initiate the Google sign-in process
      final signInAccount = await _googleSignIn.signIn();

      if (signInAccount != null) {
        // Retrieve authentication details from the Google account
        final authentication = await signInAccount.authentication;

        // Create a Google credential using the retrieved tokens
        final credential = GoogleAuthProvider.credential(
          idToken: authentication.idToken,
          accessToken: authentication.accessToken,
        );

        // Get the currently authenticated user
        final currentUser = _firebaseAuth.currentUser;

        // Handle null user case
        if (currentUser == null) {
          return left(AuthFailure.unexpected());
        }

        // Link the Google credential to the current user
        await currentUser.linkWithCredential(credential);

        return right(unit);
      }

      // Return a cancellation failure if the user cancels the sign-in process
      return left(const AuthFailure.cancelledByUser());
    } on FirebaseAuthException catch (e, st) {
      return left(AuthFailureFactory.fromFirebaseAuthException(e, st));
    } on Exception catch (e, st) {
      return left(AuthFailureFactory.fromException(e, st));
    }
  }

  // /// Link the current user's account with Facebook credentials.
  // Future<Either<AuthFailure, Unit>> linkWithFacebook() async {
  //   try {
  //     // Start the Facebook sign-in flow
  //     final LoginResult loginResult = await _facebookAuth.login();

  //     // Validate that the access token is not null, throw exception if null
  //     final AccessToken? accessToken = loginResult.accessToken;
  //     if (accessToken == null) {
  //       return left(AuthFailure.unexpected());
  //     }

  //     // Create Facebook credentials for Firebase using the access token
  //     final OAuthCredential credential = FacebookAuthProvider.credential(accessToken.tokenString);

  //     // Get the currently authenticated user
  //     final currentUser = _firebaseAuth.currentUser;

  //     // Handle null user case
  //     if (currentUser == null) {
  //       return left(AuthFailure.unexpected());
  //     }

  //     // Link the Facebook credential to the current user
  //     await currentUser.linkWithCredential(credential);

  //     return right(unit);
  //   } on FirebaseAuthException catch (e, st) {
  //     return left(AuthFailureFactory.fromFirebaseAuthException(e, st));
  //   } on Exception catch (e, st) {
  //     return left(AuthFailureFactory.fromException(e, st));
  //   }
  // }

  Either<AuthFailure, bool> isEmailVerified() {
    try {
      // Retrieve the current user from FirebaseAuth synchronously
      final currentUser = _firebaseAuth.currentUser;

      // If there is no current user, return false
      if (currentUser == null) {
        return right(false);
      }

      // Return the email verification status as a successful result
      return right(currentUser.emailVerified);
    } on FirebaseAuthException catch (e, st) {
      return left(AuthFailureFactory.fromFirebaseAuthException(e, st));
    } on Exception catch (e, st) {
      return left(AuthFailureFactory.fromException(e, st));
    }
  }

  Either<AuthFailure, List<String>> getUserAuthProviders() {
    try {
      // Retrieve the current user from FirebaseAuth synchronously
      final currentUser = _firebaseAuth.currentUser;

      // If there is no current user, return an empty list
      if (currentUser == null) {
        return right([]);
      }

      // Map the user's provider data to a list of provider IDs
      final providers = currentUser.providerData.map((userInfo) => userInfo.providerId).toList();

      // Return the list of provider IDs as a successful result
      return right(providers);
    } on FirebaseAuthException catch (e, st) {
      return left(AuthFailureFactory.fromFirebaseAuthException(e, st));
    } on Exception catch (e, st) {
      return left(AuthFailureFactory.fromException(e, st));
    }
  }
}
