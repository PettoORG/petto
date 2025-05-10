// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthFailure {
  String? get message;
  String? get code;
  dynamic get cause;
  StackTrace? get stackTrace;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthFailureCopyWith<AuthFailure> get copyWith =>
      _$AuthFailureCopyWithImpl<AuthFailure>(this as AuthFailure, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthFailure &&
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
    return 'AuthFailure(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) _then) =
      _$AuthFailureCopyWithImpl;
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._self, this._then);

  final AuthFailure _self;
  final $Res Function(AuthFailure) _then;

  /// Create a copy of AuthFailure
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

class _Unexpected extends AuthFailure {
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

  /// Create a copy of AuthFailure
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
    return 'AuthFailure.unexpected(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class _$UnexpectedCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
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

  /// Create a copy of AuthFailure
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

class _NoNetworkConnection extends AuthFailure {
  const _NoNetworkConnection(
      {this.message, this.code, this.cause, this.stackTrace})
      : super._();

  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic cause;
  @override
  final StackTrace? stackTrace;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NoNetworkConnectionCopyWith<_NoNetworkConnection> get copyWith =>
      __$NoNetworkConnectionCopyWithImpl<_NoNetworkConnection>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NoNetworkConnection &&
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
    return 'AuthFailure.network(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class _$NoNetworkConnectionCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$NoNetworkConnectionCopyWith(_NoNetworkConnection value,
          $Res Function(_NoNetworkConnection) _then) =
      __$NoNetworkConnectionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class __$NoNetworkConnectionCopyWithImpl<$Res>
    implements _$NoNetworkConnectionCopyWith<$Res> {
  __$NoNetworkConnectionCopyWithImpl(this._self, this._then);

  final _NoNetworkConnection _self;
  final $Res Function(_NoNetworkConnection) _then;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? cause = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_NoNetworkConnection(
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

class _TooManyRequests extends AuthFailure {
  const _TooManyRequests({this.message, this.code, this.cause, this.stackTrace})
      : super._();

  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic cause;
  @override
  final StackTrace? stackTrace;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TooManyRequestsCopyWith<_TooManyRequests> get copyWith =>
      __$TooManyRequestsCopyWithImpl<_TooManyRequests>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TooManyRequests &&
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
    return 'AuthFailure.tooManyRequests(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class _$TooManyRequestsCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$TooManyRequestsCopyWith(
          _TooManyRequests value, $Res Function(_TooManyRequests) _then) =
      __$TooManyRequestsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class __$TooManyRequestsCopyWithImpl<$Res>
    implements _$TooManyRequestsCopyWith<$Res> {
  __$TooManyRequestsCopyWithImpl(this._self, this._then);

  final _TooManyRequests _self;
  final $Res Function(_TooManyRequests) _then;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? cause = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_TooManyRequests(
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

class _UserDisabled extends AuthFailure {
  const _UserDisabled({this.message, this.code, this.cause, this.stackTrace})
      : super._();

  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic cause;
  @override
  final StackTrace? stackTrace;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserDisabledCopyWith<_UserDisabled> get copyWith =>
      __$UserDisabledCopyWithImpl<_UserDisabled>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDisabled &&
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
    return 'AuthFailure.userDisabled(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class _$UserDisabledCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$UserDisabledCopyWith(
          _UserDisabled value, $Res Function(_UserDisabled) _then) =
      __$UserDisabledCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class __$UserDisabledCopyWithImpl<$Res>
    implements _$UserDisabledCopyWith<$Res> {
  __$UserDisabledCopyWithImpl(this._self, this._then);

  final _UserDisabled _self;
  final $Res Function(_UserDisabled) _then;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? cause = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_UserDisabled(
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

class _EmailDoesNotExist extends AuthFailure {
  const _EmailDoesNotExist(
      {this.message, this.code, this.cause, this.stackTrace})
      : super._();

  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic cause;
  @override
  final StackTrace? stackTrace;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmailDoesNotExistCopyWith<_EmailDoesNotExist> get copyWith =>
      __$EmailDoesNotExistCopyWithImpl<_EmailDoesNotExist>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmailDoesNotExist &&
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
    return 'AuthFailure.emailDoesNotExist(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class _$EmailDoesNotExistCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$EmailDoesNotExistCopyWith(
          _EmailDoesNotExist value, $Res Function(_EmailDoesNotExist) _then) =
      __$EmailDoesNotExistCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class __$EmailDoesNotExistCopyWithImpl<$Res>
    implements _$EmailDoesNotExistCopyWith<$Res> {
  __$EmailDoesNotExistCopyWithImpl(this._self, this._then);

  final _EmailDoesNotExist _self;
  final $Res Function(_EmailDoesNotExist) _then;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? cause = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_EmailDoesNotExist(
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

class _CancelledByUser extends AuthFailure {
  const _CancelledByUser({this.message, this.code, this.cause, this.stackTrace})
      : super._();

  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic cause;
  @override
  final StackTrace? stackTrace;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CancelledByUserCopyWith<_CancelledByUser> get copyWith =>
      __$CancelledByUserCopyWithImpl<_CancelledByUser>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CancelledByUser &&
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
    return 'AuthFailure.cancelledByUser(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class _$CancelledByUserCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$CancelledByUserCopyWith(
          _CancelledByUser value, $Res Function(_CancelledByUser) _then) =
      __$CancelledByUserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class __$CancelledByUserCopyWithImpl<$Res>
    implements _$CancelledByUserCopyWith<$Res> {
  __$CancelledByUserCopyWithImpl(this._self, this._then);

  final _CancelledByUser _self;
  final $Res Function(_CancelledByUser) _then;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? cause = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_CancelledByUser(
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

class _InvalidEmailAndPasswordCombination extends AuthFailure {
  const _InvalidEmailAndPasswordCombination(
      {this.message, this.code, this.cause, this.stackTrace})
      : super._();

  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic cause;
  @override
  final StackTrace? stackTrace;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvalidEmailAndPasswordCombinationCopyWith<
          _InvalidEmailAndPasswordCombination>
      get copyWith => __$InvalidEmailAndPasswordCombinationCopyWithImpl<
          _InvalidEmailAndPasswordCombination>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvalidEmailAndPasswordCombination &&
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
    return 'AuthFailure.invalidEmailAndPasswordCombination(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class _$InvalidEmailAndPasswordCombinationCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$InvalidEmailAndPasswordCombinationCopyWith(
          _InvalidEmailAndPasswordCombination value,
          $Res Function(_InvalidEmailAndPasswordCombination) _then) =
      __$InvalidEmailAndPasswordCombinationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class __$InvalidEmailAndPasswordCombinationCopyWithImpl<$Res>
    implements _$InvalidEmailAndPasswordCombinationCopyWith<$Res> {
  __$InvalidEmailAndPasswordCombinationCopyWithImpl(this._self, this._then);

  final _InvalidEmailAndPasswordCombination _self;
  final $Res Function(_InvalidEmailAndPasswordCombination) _then;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? cause = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_InvalidEmailAndPasswordCombination(
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

class _EmailInUse extends AuthFailure {
  const _EmailInUse(
      {this.message, this.code, this.cause, this.stackTrace, this.email})
      : super._();

  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic cause;
  @override
  final StackTrace? stackTrace;
  final String? email;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmailInUseCopyWith<_EmailInUse> get copyWith =>
      __$EmailInUseCopyWithImpl<_EmailInUse>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmailInUse &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.cause, cause) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code,
      const DeepCollectionEquality().hash(cause), stackTrace, email);

  @override
  String toString() {
    return 'AuthFailure.emailInUse(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace, email: $email)';
  }
}

/// @nodoc
abstract mixin class _$EmailInUseCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$EmailInUseCopyWith(
          _EmailInUse value, $Res Function(_EmailInUse) _then) =
      __$EmailInUseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message,
      String? code,
      dynamic cause,
      StackTrace? stackTrace,
      String? email});
}

/// @nodoc
class __$EmailInUseCopyWithImpl<$Res> implements _$EmailInUseCopyWith<$Res> {
  __$EmailInUseCopyWithImpl(this._self, this._then);

  final _EmailInUse _self;
  final $Res Function(_EmailInUse) _then;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? cause = freezed,
    Object? stackTrace = freezed,
    Object? email = freezed,
  }) {
    return _then(_EmailInUse(
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
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _InvalidRole extends AuthFailure {
  const _InvalidRole({this.message, this.code, this.cause, this.stackTrace})
      : super._();

  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic cause;
  @override
  final StackTrace? stackTrace;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvalidRoleCopyWith<_InvalidRole> get copyWith =>
      __$InvalidRoleCopyWithImpl<_InvalidRole>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvalidRole &&
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
    return 'AuthFailure.invalidRole(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class _$InvalidRoleCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$InvalidRoleCopyWith(
          _InvalidRole value, $Res Function(_InvalidRole) _then) =
      __$InvalidRoleCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class __$InvalidRoleCopyWithImpl<$Res> implements _$InvalidRoleCopyWith<$Res> {
  __$InvalidRoleCopyWithImpl(this._self, this._then);

  final _InvalidRole _self;
  final $Res Function(_InvalidRole) _then;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? cause = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_InvalidRole(
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

class _InvalidPhoneNumber extends AuthFailure {
  const _InvalidPhoneNumber(
      {this.message, this.code, this.cause, this.stackTrace})
      : super._();

  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic cause;
  @override
  final StackTrace? stackTrace;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvalidPhoneNumberCopyWith<_InvalidPhoneNumber> get copyWith =>
      __$InvalidPhoneNumberCopyWithImpl<_InvalidPhoneNumber>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvalidPhoneNumber &&
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
    return 'AuthFailure.invalidPhoneNumber(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class _$InvalidPhoneNumberCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$InvalidPhoneNumberCopyWith(
          _InvalidPhoneNumber value, $Res Function(_InvalidPhoneNumber) _then) =
      __$InvalidPhoneNumberCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class __$InvalidPhoneNumberCopyWithImpl<$Res>
    implements _$InvalidPhoneNumberCopyWith<$Res> {
  __$InvalidPhoneNumberCopyWithImpl(this._self, this._then);

  final _InvalidPhoneNumber _self;
  final $Res Function(_InvalidPhoneNumber) _then;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? cause = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_InvalidPhoneNumber(
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
