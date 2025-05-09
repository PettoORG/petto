import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petto/core/domain/failure.dart';

part 'base_entity_state.freezed.dart';

/// Entity State retrieved from Firestore.
@freezed
sealed class BaseEntityState<T> with _$BaseEntityState<T> {
  const BaseEntityState._();

  /// Entity loading state (also the initial state, with a null entity).
  const factory BaseEntityState.loading(T? entity) = Loading<T>;

  /// Indicates that the stream with the entity has been loaded for the first
  /// time or due to an update from the database.
  ///
  /// [entity] contains the loaded entity.
  ///
  /// [unchanged] indicates whether the entity has changed since the last time
  /// a `data` state was emitted.
  const factory BaseEntityState.data(
    T entity, {
    @Default(false) bool unchanged,
  }) = Data<T>;

  /// Indicates that the loaded entity was deleted.
  ///
  /// [entity] contains the entity as it was before deletion.
  const factory BaseEntityState.deleted(T? entity) = Deleted<T>;

  /// Indicates that a failure occurred. It could happen during the `data`
  /// stream emission or during the execution of an event inside the
  /// EntityNotifier.
  ///
  /// [entity] contains the entity available before the failure occurred.
  ///
  /// [failure] contains the failure details.
  const factory BaseEntityState.failure(
    T? entity,
    Failure failure,
  ) = FailureState<T>;
}
