// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {
  /// Document ID in the database. Typically same as [uid].
  String get id;

  /// Firebase Authentication UID.
  String get uid;

  /// User role in the system (e.g., admin, user).
  UserRole get role;

  /// Full name of the user.
  String get displayName;

  /// User email address (used for login and communication).
  String get email;

  /// Whether the user's email is verified.
  bool get emailVerified;

  /// Optional user profile image URL.
  String? get photoUrl;

  /// Whether the user account is currently disabled.
  bool get disabled;

  /// Whether the user has an active premium subscription.
  bool get isPremium;

  /// Start date of the current premium subscription (if any).
  DateTime? get premiumStartDate;

  /// End date of the current premium subscription (if any).
  DateTime? get premiumEndDate;

  /// Date and time when the user record was created.
  DateTime? get createdAt;

  /// Date and time of the last update to the user record.
  DateTime? get modifiedAt;

  /// UID of the user who created this record.
  String get createdBy;

  /// UID of the user who last modified this record.
  String get modifiedBy;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserCopyWith<User> get copyWith =>
      _$UserCopyWithImpl<User>(this as User, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.premiumStartDate, premiumStartDate) ||
                other.premiumStartDate == premiumStartDate) &&
            (identical(other.premiumEndDate, premiumEndDate) ||
                other.premiumEndDate == premiumEndDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.modifiedBy, modifiedBy) ||
                other.modifiedBy == modifiedBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uid,
      role,
      displayName,
      email,
      emailVerified,
      photoUrl,
      disabled,
      isPremium,
      premiumStartDate,
      premiumEndDate,
      createdAt,
      modifiedAt,
      createdBy,
      modifiedBy);

  @override
  String toString() {
    return 'User(id: $id, uid: $uid, role: $role, displayName: $displayName, email: $email, emailVerified: $emailVerified, photoUrl: $photoUrl, disabled: $disabled, isPremium: $isPremium, premiumStartDate: $premiumStartDate, premiumEndDate: $premiumEndDate, createdAt: $createdAt, modifiedAt: $modifiedAt, createdBy: $createdBy, modifiedBy: $modifiedBy)';
  }
}

/// @nodoc
abstract mixin class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) _then) =
      _$UserCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String uid,
      UserRole role,
      String displayName,
      String email,
      bool emailVerified,
      String? photoUrl,
      bool disabled,
      bool isPremium,
      DateTime? premiumStartDate,
      DateTime? premiumEndDate,
      DateTime? createdAt,
      DateTime? modifiedAt,
      String createdBy,
      String modifiedBy});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? role = null,
    Object? displayName = null,
    Object? email = null,
    Object? emailVerified = null,
    Object? photoUrl = freezed,
    Object? disabled = null,
    Object? isPremium = null,
    Object? premiumStartDate = freezed,
    Object? premiumEndDate = freezed,
    Object? createdAt = freezed,
    Object? modifiedAt = freezed,
    Object? createdBy = null,
    Object? modifiedBy = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _self.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      disabled: null == disabled
          ? _self.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isPremium: null == isPremium
          ? _self.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      premiumStartDate: freezed == premiumStartDate
          ? _self.premiumStartDate
          : premiumStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      premiumEndDate: freezed == premiumEndDate
          ? _self.premiumEndDate
          : premiumEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedAt: freezed == modifiedAt
          ? _self.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: null == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedBy: null == modifiedBy
          ? _self.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _User extends User {
  const _User(
      {required this.id,
      required this.uid,
      required this.role,
      required this.displayName,
      required this.email,
      required this.emailVerified,
      required this.photoUrl,
      required this.disabled,
      required this.isPremium,
      required this.premiumStartDate,
      required this.premiumEndDate,
      required this.createdAt,
      required this.modifiedAt,
      required this.createdBy,
      required this.modifiedBy})
      : super._();

  /// Document ID in the database. Typically same as [uid].
  @override
  final String id;

  /// Firebase Authentication UID.
  @override
  final String uid;

  /// User role in the system (e.g., admin, user).
  @override
  final UserRole role;

  /// Full name of the user.
  @override
  final String displayName;

  /// User email address (used for login and communication).
  @override
  final String email;

  /// Whether the user's email is verified.
  @override
  final bool emailVerified;

  /// Optional user profile image URL.
  @override
  final String? photoUrl;

  /// Whether the user account is currently disabled.
  @override
  final bool disabled;

  /// Whether the user has an active premium subscription.
  @override
  final bool isPremium;

  /// Start date of the current premium subscription (if any).
  @override
  final DateTime? premiumStartDate;

  /// End date of the current premium subscription (if any).
  @override
  final DateTime? premiumEndDate;

  /// Date and time when the user record was created.
  @override
  final DateTime? createdAt;

  /// Date and time of the last update to the user record.
  @override
  final DateTime? modifiedAt;

  /// UID of the user who created this record.
  @override
  final String createdBy;

  /// UID of the user who last modified this record.
  @override
  final String modifiedBy;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.premiumStartDate, premiumStartDate) ||
                other.premiumStartDate == premiumStartDate) &&
            (identical(other.premiumEndDate, premiumEndDate) ||
                other.premiumEndDate == premiumEndDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.modifiedBy, modifiedBy) ||
                other.modifiedBy == modifiedBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uid,
      role,
      displayName,
      email,
      emailVerified,
      photoUrl,
      disabled,
      isPremium,
      premiumStartDate,
      premiumEndDate,
      createdAt,
      modifiedAt,
      createdBy,
      modifiedBy);

  @override
  String toString() {
    return 'User(id: $id, uid: $uid, role: $role, displayName: $displayName, email: $email, emailVerified: $emailVerified, photoUrl: $photoUrl, disabled: $disabled, isPremium: $isPremium, premiumStartDate: $premiumStartDate, premiumEndDate: $premiumEndDate, createdAt: $createdAt, modifiedAt: $modifiedAt, createdBy: $createdBy, modifiedBy: $modifiedBy)';
  }
}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) =
      __$UserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String uid,
      UserRole role,
      String displayName,
      String email,
      bool emailVerified,
      String? photoUrl,
      bool disabled,
      bool isPremium,
      DateTime? premiumStartDate,
      DateTime? premiumEndDate,
      DateTime? createdAt,
      DateTime? modifiedAt,
      String createdBy,
      String modifiedBy});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? role = null,
    Object? displayName = null,
    Object? email = null,
    Object? emailVerified = null,
    Object? photoUrl = freezed,
    Object? disabled = null,
    Object? isPremium = null,
    Object? premiumStartDate = freezed,
    Object? premiumEndDate = freezed,
    Object? createdAt = freezed,
    Object? modifiedAt = freezed,
    Object? createdBy = null,
    Object? modifiedBy = null,
  }) {
    return _then(_User(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _self.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      disabled: null == disabled
          ? _self.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isPremium: null == isPremium
          ? _self.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      premiumStartDate: freezed == premiumStartDate
          ? _self.premiumStartDate
          : premiumStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      premiumEndDate: freezed == premiumEndDate
          ? _self.premiumEndDate
          : premiumEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedAt: freezed == modifiedAt
          ? _self.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: null == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedBy: null == modifiedBy
          ? _self.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
