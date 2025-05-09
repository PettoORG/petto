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

class _Firestore extends Failure {
  const _Firestore({this.message, this.code, this.cause, this.stackTrace})
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
  _$FirestoreCopyWith<_Firestore> get copyWith =>
      __$FirestoreCopyWithImpl<_Firestore>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Firestore &&
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
abstract mixin class _$FirestoreCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$FirestoreCopyWith(
          _Firestore value, $Res Function(_Firestore) _then) =
      __$FirestoreCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class __$FirestoreCopyWithImpl<$Res> implements _$FirestoreCopyWith<$Res> {
  __$FirestoreCopyWithImpl(this._self, this._then);

  final _Firestore _self;
  final $Res Function(_Firestore) _then;

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
    return _then(_Firestore(
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

class _Storage extends Failure {
  const _Storage({this.message, this.code, this.cause, this.stackTrace})
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
  _$StorageCopyWith<_Storage> get copyWith =>
      __$StorageCopyWithImpl<_Storage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Storage &&
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
abstract mixin class _$StorageCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$StorageCopyWith(_Storage value, $Res Function(_Storage) _then) =
      __$StorageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class __$StorageCopyWithImpl<$Res> implements _$StorageCopyWith<$Res> {
  __$StorageCopyWithImpl(this._self, this._then);

  final _Storage _self;
  final $Res Function(_Storage) _then;

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
    return _then(_Storage(
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

class _Unexpected extends Failure {
  const _Unexpected({this.message, this.code, this.cause, this.stackTrace})
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
  _$UnexpectedCopyWith<_Unexpected> get copyWith =>
      __$UnexpectedCopyWithImpl<_Unexpected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Unexpected &&
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
abstract mixin class _$UnexpectedCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$UnexpectedCopyWith(
          _Unexpected value, $Res Function(_Unexpected) _then) =
      __$UnexpectedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class __$UnexpectedCopyWithImpl<$Res> implements _$UnexpectedCopyWith<$Res> {
  __$UnexpectedCopyWithImpl(this._self, this._then);

  final _Unexpected _self;
  final $Res Function(_Unexpected) _then;

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
    return _then(_Unexpected(
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

class _Network extends Failure {
  const _Network({this.message, this.code, this.cause, this.stackTrace})
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
  _$NetworkCopyWith<_Network> get copyWith =>
      __$NetworkCopyWithImpl<_Network>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Network &&
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
abstract mixin class _$NetworkCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$NetworkCopyWith(_Network value, $Res Function(_Network) _then) =
      __$NetworkCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class __$NetworkCopyWithImpl<$Res> implements _$NetworkCopyWith<$Res> {
  __$NetworkCopyWithImpl(this._self, this._then);

  final _Network _self;
  final $Res Function(_Network) _then;

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
    return _then(_Network(
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

class _Validation extends Failure {
  const _Validation({this.message, this.code, this.cause, this.stackTrace})
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
  _$ValidationCopyWith<_Validation> get copyWith =>
      __$ValidationCopyWithImpl<_Validation>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Validation &&
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
abstract mixin class _$ValidationCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$ValidationCopyWith(
          _Validation value, $Res Function(_Validation) _then) =
      __$ValidationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class __$ValidationCopyWithImpl<$Res> implements _$ValidationCopyWith<$Res> {
  __$ValidationCopyWithImpl(this._self, this._then);

  final _Validation _self;
  final $Res Function(_Validation) _then;

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
    return _then(_Validation(
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
