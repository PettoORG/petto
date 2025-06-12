// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Failure {
  String? get message;
  String? get code;
  dynamic get cause;
  StackTrace? get stackTrace;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FailureCopyWith<Failure> get copyWith =>
      _$FailureCopyWithImpl<Failure>(this as Failure, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Failure &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.cause, cause) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code,
      const DeepCollectionEquality().hash(cause), stackTrace);

  @override
  String toString() {
    return 'Failure(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) =
      _$FailureCopyWithImpl;
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? cause = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_self.copyWith(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      cause: freezed == cause
          ? _self.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as dynamic,
      stackTrace: freezed == stackTrace
          ? _self.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class Firestore extends Failure {
  const Firestore({this.message, this.code, this.cause, this.stackTrace})
      : super._();

  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic cause;
  @override
  final StackTrace? stackTrace;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FirestoreCopyWith<Firestore> get copyWith =>
      _$FirestoreCopyWithImpl<Firestore>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Firestore &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.cause, cause) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code,
      const DeepCollectionEquality().hash(cause), stackTrace);

  @override
  String toString() {
    return 'Failure.firestore(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class $FirestoreCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $FirestoreCopyWith(Firestore value, $Res Function(Firestore) _then) =
      _$FirestoreCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class _$FirestoreCopyWithImpl<$Res> implements $FirestoreCopyWith<$Res> {
  _$FirestoreCopyWithImpl(this._self, this._then);

  final Firestore _self;
  final $Res Function(Firestore) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? cause = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(Firestore(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      cause: freezed == cause
          ? _self.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as dynamic,
      stackTrace: freezed == stackTrace
          ? _self.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class Storage extends Failure {
  const Storage({this.message, this.code, this.cause, this.stackTrace})
      : super._();

  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic cause;
  @override
  final StackTrace? stackTrace;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StorageCopyWith<Storage> get copyWith =>
      _$StorageCopyWithImpl<Storage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Storage &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.cause, cause) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code,
      const DeepCollectionEquality().hash(cause), stackTrace);

  @override
  String toString() {
    return 'Failure.storage(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class $StorageCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $StorageCopyWith(Storage value, $Res Function(Storage) _then) =
      _$StorageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class _$StorageCopyWithImpl<$Res> implements $StorageCopyWith<$Res> {
  _$StorageCopyWithImpl(this._self, this._then);

  final Storage _self;
  final $Res Function(Storage) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? cause = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(Storage(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      cause: freezed == cause
          ? _self.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as dynamic,
      stackTrace: freezed == stackTrace
          ? _self.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class Unexpected extends Failure {
  const Unexpected({this.message, this.code, this.cause, this.stackTrace})
      : super._();

  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic cause;
  @override
  final StackTrace? stackTrace;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnexpectedCopyWith<Unexpected> get copyWith =>
      _$UnexpectedCopyWithImpl<Unexpected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Unexpected &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.cause, cause) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code,
      const DeepCollectionEquality().hash(cause), stackTrace);

  @override
  String toString() {
    return 'Failure.unexpected(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class $UnexpectedCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $UnexpectedCopyWith(
          Unexpected value, $Res Function(Unexpected) _then) =
      _$UnexpectedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class _$UnexpectedCopyWithImpl<$Res> implements $UnexpectedCopyWith<$Res> {
  _$UnexpectedCopyWithImpl(this._self, this._then);

  final Unexpected _self;
  final $Res Function(Unexpected) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? cause = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(Unexpected(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      cause: freezed == cause
          ? _self.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as dynamic,
      stackTrace: freezed == stackTrace
          ? _self.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class Network extends Failure {
  const Network({this.message, this.code, this.cause, this.stackTrace})
      : super._();

  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic cause;
  @override
  final StackTrace? stackTrace;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NetworkCopyWith<Network> get copyWith =>
      _$NetworkCopyWithImpl<Network>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Network &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.cause, cause) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code,
      const DeepCollectionEquality().hash(cause), stackTrace);

  @override
  String toString() {
    return 'Failure.network(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class $NetworkCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $NetworkCopyWith(Network value, $Res Function(Network) _then) =
      _$NetworkCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class _$NetworkCopyWithImpl<$Res> implements $NetworkCopyWith<$Res> {
  _$NetworkCopyWithImpl(this._self, this._then);

  final Network _self;
  final $Res Function(Network) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? cause = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(Network(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      cause: freezed == cause
          ? _self.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as dynamic,
      stackTrace: freezed == stackTrace
          ? _self.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class Validation extends Failure {
  const Validation({this.message, this.code, this.cause, this.stackTrace})
      : super._();

  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic cause;
  @override
  final StackTrace? stackTrace;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ValidationCopyWith<Validation> get copyWith =>
      _$ValidationCopyWithImpl<Validation>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Validation &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.cause, cause) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code,
      const DeepCollectionEquality().hash(cause), stackTrace);

  @override
  String toString() {
    return 'Failure.validation(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class $ValidationCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $ValidationCopyWith(
          Validation value, $Res Function(Validation) _then) =
      _$ValidationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class _$ValidationCopyWithImpl<$Res> implements $ValidationCopyWith<$Res> {
  _$ValidationCopyWithImpl(this._self, this._then);

  final Validation _self;
  final $Res Function(Validation) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? cause = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(Validation(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      cause: freezed == cause
          ? _self.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as dynamic,
      stackTrace: freezed == stackTrace
          ? _self.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

// dart format on
