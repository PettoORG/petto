import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:petto/core/domain/failure.dart';
import 'package:petto/users/domain/user.dart';
import 'package:petto/users/infrastructure/user_dto.dart';
import 'package:rxdart/rxdart.dart';

/// Firestore repository for Users. This implementations does not extend
/// BaseFirestoreRepository to remove any dependency from authenticated user.
/// Notice that methods and implementation is almost identical.
class UserFirestoreRepository {
  /// Collection path in Firestore.
  final String collectionPath;

  /// Firestore instance.
  final FirebaseFirestore firestore;

  UserFirestoreRepository({
    required this.collectionPath,
    required this.firestore,
  });

  /// Returns Future with "a Failure or an Entity", provided its [id].
  Future<Either<Failure, User>> fetch(String id) async {
    try {
      final snap = await firestore.collection(collectionPath).doc(id).get();
      final entity = UserDTO.fromDocumentSnapshot(snap).toDomain();
      return right(entity);
    } on FirebaseException catch (e, st) {
      return left(FailureFactory.fromFirebaseException(e, st));
    } on Exception catch (e, st) {
      return left(FailureFactory.fromException(e, st));
    }
  }

  /// Returns Stream with "a Failure or an Entity", provided its [id]. If id is
  /// '0', it returns an empty entity. An [emptyEntity] can be provided for this
  /// method, if not, it uses the [emptyEntity] provided in the constructor.
  Stream<Either<Failure, User>> stream(String id) {
    final empty = User.empty();
    if (id == '0') return Stream.value(right(empty));

    return firestore
        .collection(collectionPath)
        .doc(id)
        .snapshots()
        .map((snap) => right<Failure, User>(UserDTO.fromDocumentSnapshot(snap).toDomain()))
        .onErrorReturnWith((e, st) {
      if (e is FirebaseException) {
        return left(FailureFactory.fromFirebaseException(e, st));
      } else {
        return left(
          Failure.unexpected(
            message: 'Error desconocido.',
            code: null,
            cause: e,
            stackTrace: st,
          ),
        );
      }
    });
  }

  /// Returns Future with "a Failure or a List of Entities", provided a [query].
  Future<Either<Failure, List<User>>> fetchQuery(Query<User> query) async {
    try {
      final snaps = await query.get();
      final entities = snaps.docs.map((snap) => snap.data()).toList();
      return right(entities);
    } on FirebaseException catch (e, st) {
      return left(FailureFactory.fromFirebaseException(e, st));
    } on Exception catch (e, st) {
      return left(FailureFactory.fromException(e, st));
    }
  }

  /// Returns Stream with "a Failure or a List of Entities", provided a [query].
  Stream<Either<Failure, List<User>>> streamQuery(Query<User> query) {
    return query
        .snapshots()
        .map(
          (snaps) => right<Failure, List<User>>(
            snaps.docs.map((snap) => snap.data()).toList(),
          ),
        )
        .onErrorReturnWith((e, st) {
      if (e is FirebaseException) {
        return left(FailureFactory.fromFirebaseException(e, st));
      } else {
        return left(
          Failure.unexpected(
            message: 'Error desconocido.',
            code: null,
            cause: e,
            stackTrace: st,
          ),
        );
      }
    });
  }

  /// Checks if a user exists in Firestore by UID.
  Future<Either<Failure, bool>> userExists(String uid) async {
    try {
      final doc = await firestore.collection(collectionPath).doc(uid).get();
      return right(doc.exists);
    } on FirebaseException catch (e, st) {
      return left(FailureFactory.fromFirebaseException(e, st));
    } on Exception catch (e, st) {
      return left(FailureFactory.fromException(e, st));
    }
  }

  /// Creates a entity and returns a Future with "a Failure or an id", provided
  /// an [entity] with data.
  ///
  /// Notice that this method does not user DTO's 'toCreateDocument' method. It
  /// just uses 'toDocument' method. This means that values for 'createdAt',
  /// 'createdBy', 'modifiedAt' and 'modifiedBy' must be set before calling this
  /// method.
  Future<Either<Failure, String>> create(User entity) async {
    try {
      final ref = firestore.collection(collectionPath).doc(entity.uid);
      final data = UserDTO.fromDomain(entity).toCreateDocument(entity);
      await ref.set(data);
      return right(ref.id);
    } on FirebaseException catch (e, st) {
      return left(FailureFactory.fromFirebaseException(e, st));
    } on Exception catch (e, st) {
      return left(FailureFactory.fromException(e, st));
    }
  }

  /// Updates an entity and returns a Future with "a Failure or Unit", provided
  /// an [id] and an [entity] with data.
  ///
  /// Notice that this method does not user DTO's 'toUpdateDocument' method. It
  /// just uses 'toDocument' method. This means that values for 'modifiedAt' and
  /// 'modifiedBy' must be set before calling this method.
  Future<Either<Failure, Unit>> update(String id, User entity) async {
    try {
      final ref = firestore.collection(collectionPath).doc(id);
      final data = UserDTO.fromDomain(entity).toUpdateDocument(entity);
      await ref.update(data);
      return right(unit);
    } on FirebaseException catch (e, st) {
      return left(FailureFactory.fromFirebaseException(e, st));
    } on Exception catch (e, st) {
      return left(FailureFactory.fromException(e, st));
    }
  }

  /// Deletes an entity and returns a Future with "a Failure or Unit", provided
  /// an [id].
  Future<Either<Failure, Unit>> delete(String id) async {
    try {
      final ref = firestore.collection(collectionPath).doc(id);
      await ref.delete();
      return right(unit);
    } on FirebaseException catch (e, st) {
      return left(FailureFactory.fromFirebaseException(e, st));
    } on Exception catch (e, st) {
      return left(FailureFactory.fromException(e, st));
    }
  }
}
