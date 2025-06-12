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

class Network extends AuthFailure {
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

  /// Create a copy of AuthFailure
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
    return 'AuthFailure.network(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class $NetworkCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
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

class TooManyRequests extends AuthFailure {
  const TooManyRequests({this.message, this.code, this.cause, this.stackTrace})
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
  $TooManyRequestsCopyWith<TooManyRequests> get copyWith =>
      _$TooManyRequestsCopyWithImpl<TooManyRequests>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TooManyRequests &&
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
abstract mixin class $TooManyRequestsCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory $TooManyRequestsCopyWith(
          TooManyRequests value, $Res Function(TooManyRequests) _then) =
      _$TooManyRequestsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class _$TooManyRequestsCopyWithImpl<$Res>
    implements $TooManyRequestsCopyWith<$Res> {
  _$TooManyRequestsCopyWithImpl(this._self, this._then);

  final TooManyRequests _self;
  final $Res Function(TooManyRequests) _then;

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
    return _then(TooManyRequests(
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

class UserDisabled extends AuthFailure {
  const UserDisabled({this.message, this.code, this.cause, this.stackTrace})
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
  $UserDisabledCopyWith<UserDisabled> get copyWith =>
      _$UserDisabledCopyWithImpl<UserDisabled>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserDisabled &&
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
abstract mixin class $UserDisabledCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory $UserDisabledCopyWith(
          UserDisabled value, $Res Function(UserDisabled) _then) =
      _$UserDisabledCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class _$UserDisabledCopyWithImpl<$Res> implements $UserDisabledCopyWith<$Res> {
  _$UserDisabledCopyWithImpl(this._self, this._then);

  final UserDisabled _self;
  final $Res Function(UserDisabled) _then;

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
    return _then(UserDisabled(
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

class InvalidEmail extends AuthFailure {
  const InvalidEmail({this.message, this.code, this.cause, this.stackTrace})
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
  $InvalidEmailCopyWith<InvalidEmail> get copyWith =>
      _$InvalidEmailCopyWithImpl<InvalidEmail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvalidEmail &&
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
    return 'AuthFailure.invalidEmail(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class $InvalidEmailCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory $InvalidEmailCopyWith(
          InvalidEmail value, $Res Function(InvalidEmail) _then) =
      _$InvalidEmailCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class _$InvalidEmailCopyWithImpl<$Res> implements $InvalidEmailCopyWith<$Res> {
  _$InvalidEmailCopyWithImpl(this._self, this._then);

  final InvalidEmail _self;
  final $Res Function(InvalidEmail) _then;

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
    return _then(InvalidEmail(
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

class EmailDoesNotExist extends AuthFailure {
  const EmailDoesNotExist(
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
  $EmailDoesNotExistCopyWith<EmailDoesNotExist> get copyWith =>
      _$EmailDoesNotExistCopyWithImpl<EmailDoesNotExist>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmailDoesNotExist &&
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
abstract mixin class $EmailDoesNotExistCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory $EmailDoesNotExistCopyWith(
          EmailDoesNotExist value, $Res Function(EmailDoesNotExist) _then) =
      _$EmailDoesNotExistCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class _$EmailDoesNotExistCopyWithImpl<$Res>
    implements $EmailDoesNotExistCopyWith<$Res> {
  _$EmailDoesNotExistCopyWithImpl(this._self, this._then);

  final EmailDoesNotExist _self;
  final $Res Function(EmailDoesNotExist) _then;

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
    return _then(EmailDoesNotExist(
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

class WeakPassword extends AuthFailure {
  const WeakPassword({this.message, this.code, this.cause, this.stackTrace})
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
  $WeakPasswordCopyWith<WeakPassword> get copyWith =>
      _$WeakPasswordCopyWithImpl<WeakPassword>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeakPassword &&
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
    return 'AuthFailure.weakPassword(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class $WeakPasswordCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory $WeakPasswordCopyWith(
          WeakPassword value, $Res Function(WeakPassword) _then) =
      _$WeakPasswordCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class _$WeakPasswordCopyWithImpl<$Res> implements $WeakPasswordCopyWith<$Res> {
  _$WeakPasswordCopyWithImpl(this._self, this._then);

  final WeakPassword _self;
  final $Res Function(WeakPassword) _then;

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
    return _then(WeakPassword(
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

class InvalidEmailAndPasswordCombination extends AuthFailure {
  const InvalidEmailAndPasswordCombination(
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
  $InvalidEmailAndPasswordCombinationCopyWith<
          InvalidEmailAndPasswordCombination>
      get copyWith => _$InvalidEmailAndPasswordCombinationCopyWithImpl<
          InvalidEmailAndPasswordCombination>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvalidEmailAndPasswordCombination &&
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
abstract mixin class $InvalidEmailAndPasswordCombinationCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory $InvalidEmailAndPasswordCombinationCopyWith(
          InvalidEmailAndPasswordCombination value,
          $Res Function(InvalidEmailAndPasswordCombination) _then) =
      _$InvalidEmailAndPasswordCombinationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class _$InvalidEmailAndPasswordCombinationCopyWithImpl<$Res>
    implements $InvalidEmailAndPasswordCombinationCopyWith<$Res> {
  _$InvalidEmailAndPasswordCombinationCopyWithImpl(this._self, this._then);

  final InvalidEmailAndPasswordCombination _self;
  final $Res Function(InvalidEmailAndPasswordCombination) _then;

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
    return _then(InvalidEmailAndPasswordCombination(
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

class EmailInUse extends AuthFailure {
  const EmailInUse(
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
  $EmailInUseCopyWith<EmailInUse> get copyWith =>
      _$EmailInUseCopyWithImpl<EmailInUse>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmailInUse &&
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
abstract mixin class $EmailInUseCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory $EmailInUseCopyWith(
          EmailInUse value, $Res Function(EmailInUse) _then) =
      _$EmailInUseCopyWithImpl;
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
class _$EmailInUseCopyWithImpl<$Res> implements $EmailInUseCopyWith<$Res> {
  _$EmailInUseCopyWithImpl(this._self, this._then);

  final EmailInUse _self;
  final $Res Function(EmailInUse) _then;

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
    return _then(EmailInUse(
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

class CredentialAlreadyInUse extends AuthFailure {
  const CredentialAlreadyInUse(
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
  $CredentialAlreadyInUseCopyWith<CredentialAlreadyInUse> get copyWith =>
      _$CredentialAlreadyInUseCopyWithImpl<CredentialAlreadyInUse>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CredentialAlreadyInUse &&
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
    return 'AuthFailure.credentialAlreadyInUse(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class $CredentialAlreadyInUseCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory $CredentialAlreadyInUseCopyWith(CredentialAlreadyInUse value,
          $Res Function(CredentialAlreadyInUse) _then) =
      _$CredentialAlreadyInUseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class _$CredentialAlreadyInUseCopyWithImpl<$Res>
    implements $CredentialAlreadyInUseCopyWith<$Res> {
  _$CredentialAlreadyInUseCopyWithImpl(this._self, this._then);

  final CredentialAlreadyInUse _self;
  final $Res Function(CredentialAlreadyInUse) _then;

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
    return _then(CredentialAlreadyInUse(
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

class ProviderAlreadyLinked extends AuthFailure {
  const ProviderAlreadyLinked(
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
  $ProviderAlreadyLinkedCopyWith<ProviderAlreadyLinked> get copyWith =>
      _$ProviderAlreadyLinkedCopyWithImpl<ProviderAlreadyLinked>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProviderAlreadyLinked &&
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
    return 'AuthFailure.providerAlreadyLinked(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class $ProviderAlreadyLinkedCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory $ProviderAlreadyLinkedCopyWith(ProviderAlreadyLinked value,
          $Res Function(ProviderAlreadyLinked) _then) =
      _$ProviderAlreadyLinkedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class _$ProviderAlreadyLinkedCopyWithImpl<$Res>
    implements $ProviderAlreadyLinkedCopyWith<$Res> {
  _$ProviderAlreadyLinkedCopyWithImpl(this._self, this._then);

  final ProviderAlreadyLinked _self;
  final $Res Function(ProviderAlreadyLinked) _then;

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
    return _then(ProviderAlreadyLinked(
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

class UserMismatch extends AuthFailure {
  const UserMismatch({this.message, this.code, this.cause, this.stackTrace})
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
  $UserMismatchCopyWith<UserMismatch> get copyWith =>
      _$UserMismatchCopyWithImpl<UserMismatch>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserMismatch &&
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
    return 'AuthFailure.userMismatch(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class $UserMismatchCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory $UserMismatchCopyWith(
          UserMismatch value, $Res Function(UserMismatch) _then) =
      _$UserMismatchCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class _$UserMismatchCopyWithImpl<$Res> implements $UserMismatchCopyWith<$Res> {
  _$UserMismatchCopyWithImpl(this._self, this._then);

  final UserMismatch _self;
  final $Res Function(UserMismatch) _then;

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
    return _then(UserMismatch(
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

class InvalidPhoneNumber extends AuthFailure {
  const InvalidPhoneNumber(
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
  $InvalidPhoneNumberCopyWith<InvalidPhoneNumber> get copyWith =>
      _$InvalidPhoneNumberCopyWithImpl<InvalidPhoneNumber>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvalidPhoneNumber &&
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
abstract mixin class $InvalidPhoneNumberCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory $InvalidPhoneNumberCopyWith(
          InvalidPhoneNumber value, $Res Function(InvalidPhoneNumber) _then) =
      _$InvalidPhoneNumberCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class _$InvalidPhoneNumberCopyWithImpl<$Res>
    implements $InvalidPhoneNumberCopyWith<$Res> {
  _$InvalidPhoneNumberCopyWithImpl(this._self, this._then);

  final InvalidPhoneNumber _self;
  final $Res Function(InvalidPhoneNumber) _then;

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
    return _then(InvalidPhoneNumber(
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

class RequiresRecentLogin extends AuthFailure {
  const RequiresRecentLogin(
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
  $RequiresRecentLoginCopyWith<RequiresRecentLogin> get copyWith =>
      _$RequiresRecentLoginCopyWithImpl<RequiresRecentLogin>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RequiresRecentLogin &&
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
    return 'AuthFailure.requiresRecentLogin(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class $RequiresRecentLoginCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory $RequiresRecentLoginCopyWith(
          RequiresRecentLogin value, $Res Function(RequiresRecentLogin) _then) =
      _$RequiresRecentLoginCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class _$RequiresRecentLoginCopyWithImpl<$Res>
    implements $RequiresRecentLoginCopyWith<$Res> {
  _$RequiresRecentLoginCopyWithImpl(this._self, this._then);

  final RequiresRecentLogin _self;
  final $Res Function(RequiresRecentLogin) _then;

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
    return _then(RequiresRecentLogin(
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

class CancelledByUser extends AuthFailure {
  const CancelledByUser({this.message, this.code, this.cause, this.stackTrace})
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
  $CancelledByUserCopyWith<CancelledByUser> get copyWith =>
      _$CancelledByUserCopyWithImpl<CancelledByUser>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CancelledByUser &&
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
abstract mixin class $CancelledByUserCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory $CancelledByUserCopyWith(
          CancelledByUser value, $Res Function(CancelledByUser) _then) =
      _$CancelledByUserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class _$CancelledByUserCopyWithImpl<$Res>
    implements $CancelledByUserCopyWith<$Res> {
  _$CancelledByUserCopyWithImpl(this._self, this._then);

  final CancelledByUser _self;
  final $Res Function(CancelledByUser) _then;

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
    return _then(CancelledByUser(
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

class InvalidRole extends AuthFailure {
  const InvalidRole({this.message, this.code, this.cause, this.stackTrace})
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
  $InvalidRoleCopyWith<InvalidRole> get copyWith =>
      _$InvalidRoleCopyWithImpl<InvalidRole>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvalidRole &&
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
abstract mixin class $InvalidRoleCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory $InvalidRoleCopyWith(
          InvalidRole value, $Res Function(InvalidRole) _then) =
      _$InvalidRoleCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message, String? code, dynamic cause, StackTrace? stackTrace});
}

/// @nodoc
class _$InvalidRoleCopyWithImpl<$Res> implements $InvalidRoleCopyWith<$Res> {
  _$InvalidRoleCopyWithImpl(this._self, this._then);

  final InvalidRole _self;
  final $Res Function(InvalidRole) _then;

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
    return _then(InvalidRole(
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

class Unexpected extends AuthFailure {
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

  /// Create a copy of AuthFailure
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
    return 'AuthFailure.unexpected(message: $message, code: $code, cause: $cause, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class $UnexpectedCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
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

// dart format on
