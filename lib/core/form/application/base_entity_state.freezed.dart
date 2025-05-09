// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_entity_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BaseEntityState<T> {
  T? get entity;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BaseEntityState<T> &&
            const DeepCollectionEquality().equals(other.entity, entity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(entity));

  @override
  String toString() {
    return 'BaseEntityState<$T>(entity: $entity)';
  }
}

/// @nodoc
class $BaseEntityStateCopyWith<T, $Res> {
  $BaseEntityStateCopyWith(
      BaseEntityState<T> _, $Res Function(BaseEntityState<T>) __);
}

/// @nodoc

class Loading<T> extends BaseEntityState<T> {
  const Loading(this.entity) : super._();

  @override
  final T? entity;

  /// Create a copy of BaseEntityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadingCopyWith<T, Loading<T>> get copyWith =>
      _$LoadingCopyWithImpl<T, Loading<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Loading<T> &&
            const DeepCollectionEquality().equals(other.entity, entity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(entity));

  @override
  String toString() {
    return 'BaseEntityState<$T>.loading(entity: $entity)';
  }
}

/// @nodoc
abstract mixin class $LoadingCopyWith<T, $Res>
    implements $BaseEntityStateCopyWith<T, $Res> {
  factory $LoadingCopyWith(Loading<T> value, $Res Function(Loading<T>) _then) =
      _$LoadingCopyWithImpl;
  @useResult
  $Res call({T? entity});
}

/// @nodoc
class _$LoadingCopyWithImpl<T, $Res> implements $LoadingCopyWith<T, $Res> {
  _$LoadingCopyWithImpl(this._self, this._then);

  final Loading<T> _self;
  final $Res Function(Loading<T>) _then;

  /// Create a copy of BaseEntityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? entity = freezed,
  }) {
    return _then(Loading<T>(
      freezed == entity
          ? _self.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class Data<T> extends BaseEntityState<T> {
  const Data(this.entity, {this.unchanged = false}) : super._();

  @override
  final T entity;
  @JsonKey()
  final bool unchanged;

  /// Create a copy of BaseEntityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataCopyWith<T, Data<T>> get copyWith =>
      _$DataCopyWithImpl<T, Data<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Data<T> &&
            const DeepCollectionEquality().equals(other.entity, entity) &&
            (identical(other.unchanged, unchanged) ||
                other.unchanged == unchanged));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(entity), unchanged);

  @override
  String toString() {
    return 'BaseEntityState<$T>.data(entity: $entity, unchanged: $unchanged)';
  }
}

/// @nodoc
abstract mixin class $DataCopyWith<T, $Res>
    implements $BaseEntityStateCopyWith<T, $Res> {
  factory $DataCopyWith(Data<T> value, $Res Function(Data<T>) _then) =
      _$DataCopyWithImpl;
  @useResult
  $Res call({T entity, bool unchanged});
}

/// @nodoc
class _$DataCopyWithImpl<T, $Res> implements $DataCopyWith<T, $Res> {
  _$DataCopyWithImpl(this._self, this._then);

  final Data<T> _self;
  final $Res Function(Data<T>) _then;

  /// Create a copy of BaseEntityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? entity = freezed,
    Object? unchanged = null,
  }) {
    return _then(Data<T>(
      freezed == entity
          ? _self.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as T,
      unchanged: null == unchanged
          ? _self.unchanged
          : unchanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class Deleted<T> extends BaseEntityState<T> {
  const Deleted(this.entity) : super._();

  @override
  final T? entity;

  /// Create a copy of BaseEntityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeletedCopyWith<T, Deleted<T>> get copyWith =>
      _$DeletedCopyWithImpl<T, Deleted<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Deleted<T> &&
            const DeepCollectionEquality().equals(other.entity, entity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(entity));

  @override
  String toString() {
    return 'BaseEntityState<$T>.deleted(entity: $entity)';
  }
}

/// @nodoc
abstract mixin class $DeletedCopyWith<T, $Res>
    implements $BaseEntityStateCopyWith<T, $Res> {
  factory $DeletedCopyWith(Deleted<T> value, $Res Function(Deleted<T>) _then) =
      _$DeletedCopyWithImpl;
  @useResult
  $Res call({T? entity});
}

/// @nodoc
class _$DeletedCopyWithImpl<T, $Res> implements $DeletedCopyWith<T, $Res> {
  _$DeletedCopyWithImpl(this._self, this._then);

  final Deleted<T> _self;
  final $Res Function(Deleted<T>) _then;

  /// Create a copy of BaseEntityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? entity = freezed,
  }) {
    return _then(Deleted<T>(
      freezed == entity
          ? _self.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class FailureState<T> extends BaseEntityState<T> {
  const FailureState(this.entity, this.failure) : super._();

  @override
  final T? entity;
  final Failure failure;

  /// Create a copy of BaseEntityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FailureStateCopyWith<T, FailureState<T>> get copyWith =>
      _$FailureStateCopyWithImpl<T, FailureState<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FailureState<T> &&
            const DeepCollectionEquality().equals(other.entity, entity) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(entity), failure);

  @override
  String toString() {
    return 'BaseEntityState<$T>.failure(entity: $entity, failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $FailureStateCopyWith<T, $Res>
    implements $BaseEntityStateCopyWith<T, $Res> {
  factory $FailureStateCopyWith(
          FailureState<T> value, $Res Function(FailureState<T>) _then) =
      _$FailureStateCopyWithImpl;
  @useResult
  $Res call({T? entity, Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class _$FailureStateCopyWithImpl<T, $Res>
    implements $FailureStateCopyWith<T, $Res> {
  _$FailureStateCopyWithImpl(this._self, this._then);

  final FailureState<T> _self;
  final $Res Function(FailureState<T>) _then;

  /// Create a copy of BaseEntityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? entity = freezed,
    Object? failure = null,
  }) {
    return _then(FailureState<T>(
      freezed == entity
          ? _self.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as T?,
      null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }

  /// Create a copy of BaseEntityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_self.failure, (value) {
      return _then(_self.copyWith(failure: value));
    });
  }
}

// dart format on
