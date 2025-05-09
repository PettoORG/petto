import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:petto/core/domain/base_entity.dart';
import 'package:petto/core/infrastructure/base_firestore_repository.dart';

/// Interface to be used in a Riverpod Entity Notifier class. It provides
/// minimal methods that must be implemented for clarity and consistency.
abstract interface class BaseEntityNotifier<T extends BaseEntity> {
  /// Setter for the Entity Id.
  set id(String? id);

  /// Getter (boolean) with current internet connection status.
  bool? get internetConnection;

  /// Instance of Firestore Repository.
  BaseFirestoreRepository get repository;

  /// Instance of Firebase Crashlytics.
  FirebaseCrashlytics get crashlytics;

  /// Given an Entity, it saves it in the Database. It creates a new Entity if
  /// the Entity's id is '0'. Otherwise, it updates the Entity.
  Future<void> save(T entity);

  /// Creates a new Entity in the Database, via the 'repository'.
  Future<void> create(T entity);

  /// Updates an Entity in the Database, via the 'repository'.
  Future<void> update(T entity);

  /// Given an Entity's [id], deletes an Entity in the Database, via the
  /// 'repository'.
  Future<void> delete(String id);
}
