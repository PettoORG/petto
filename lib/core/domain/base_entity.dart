/// Describes a Firestore entity, as it should be implemented in Freezed.
abstract interface class BaseEntity {
  String get id;

  /// Creates a copy of the entity with the fields passed as parameters.
  /// If no fields are passed, an identical copy will be created.
  dynamic get copyWith;
}
