import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petto/core/domain/failure.dart';
import 'package:petto/core/infrastructure/base_dto.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dartz/dartz.dart';
import 'package:petto/users/domain/user.dart';

/// Base Firestore Repository class that all Firestore repositories should extend.
/// It provides CRUD operations for Firestore collections and documents.
class BaseFirestoreRepository<T> {
  /// Collection path in Firestore.
  final String collectionPath;

  /// Firestore instance.
  final FirebaseFirestore firestore;

  /// Authenticated user (who performs the operations).
  final User user;

  /// Empty entity to return when a document is required with id '0'..
  final T emptyEntity;

  /// Callback to convert a domain entity to a Data Transfer Object.
  final BaseDTO<T> Function(T entity) fromDomain;

  /// Callback to convert a Firestore DocumentSnapshot to Data Transfer Object.
  final BaseDTO<T> Function(DocumentSnapshot snap) fromDocumentSnapshot;

  BaseFirestoreRepository({
    required this.collectionPath,
    required this.firestore,
    required this.user,
    required this.emptyEntity,
    required this.fromDomain,
    required this.fromDocumentSnapshot,
  });

  /// Returns Future with "a Failure or an Entity", provided its [id].
  Future<Either<Failure, T>> fetch(String id) async {
    try {
      final snap = await firestore.collection(collectionPath).doc(id).get();
      final entity = fromDocumentSnapshot(snap).toDomain();
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
  Stream<Either<Failure, T>> stream(String id, {T? emptyEntity}) {
    final empty = emptyEntity ?? this.emptyEntity;
    if (id == '0') return Stream.value(right(empty));

    return firestore
        .collection(collectionPath)
        .doc(id)
        .snapshots()
        .map((snap) => right<Failure, T>(fromDocumentSnapshot(snap).toDomain()))
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
  Future<Either<Failure, List<T>>> fetchQuery(Query<T> query) async {
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
  Stream<Either<Failure, List<T>>> streamQuery(Query<T> query) {
    return query
        .snapshots()
        .map(
          (snaps) => right<Failure, List<T>>(
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

  /// Creates a entity and returns a Future with "a Failure or an id", provided
  /// an [entity] with data. If [collectionPath] is provided, it will be used
  /// instead of the one provided in the constructor.
  Future<Either<Failure, String>> create(T entity) async {
    try {
      final ref = firestore.collection(collectionPath).doc();
      final data = fromDomain(entity).toCreateDocument(user);
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
  Future<Either<Failure, Unit>> update(String id, T entity) async {
    try {
      final ref = firestore.collection(collectionPath).doc(id);
      final data = fromDomain(entity).toUpdateDocument(user);
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
