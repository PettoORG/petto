// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDTO {
  String get id;
  String get uid;
  UserRole get role;
  String get email;
  bool get emailVerified;
  String? get photoUrl;
  String get displayName;
  bool get disabled;
  @TimestampConverter()
  DateTime? get createdAt;
  @TimestampConverter()
  DateTime? get modifiedAt;
  String get createdBy;
  String get modifiedBy;
  bool get isPremium;
  @TimestampConverter()
  DateTime? get premiumStartDate;
  @TimestampConverter()
  DateTime? get premiumEndDate;

  /// Create a copy of UserDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserDTOCopyWith<UserDTO> get copyWith =>
      _$UserDTOCopyWithImpl<UserDTO>(this as UserDTO, _$identity);

  /// Serializes this UserDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.modifiedBy, modifiedBy) ||
                other.modifiedBy == modifiedBy) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.premiumStartDate, premiumStartDate) ||
                other.premiumStartDate == premiumStartDate) &&
            (identical(other.premiumEndDate, premiumEndDate) ||
                other.premiumEndDate == premiumEndDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uid,
      role,
      email,
      emailVerified,
      photoUrl,
      displayName,
      disabled,
      createdAt,
      modifiedAt,
      createdBy,
      modifiedBy,
      isPremium,
      premiumStartDate,
      premiumEndDate);

  @override
  String toString() {
    return 'UserDTO(id: $id, uid: $uid, role: $role, email: $email, emailVerified: $emailVerified, photoUrl: $photoUrl, displayName: $displayName, disabled: $disabled, createdAt: $createdAt, modifiedAt: $modifiedAt, createdBy: $createdBy, modifiedBy: $modifiedBy, isPremium: $isPremium, premiumStartDate: $premiumStartDate, premiumEndDate: $premiumEndDate)';
  }
}

/// @nodoc
abstract mixin class $UserDTOCopyWith<$Res> {
  factory $UserDTOCopyWith(UserDTO value, $Res Function(UserDTO) _then) =
      _$UserDTOCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String uid,
      UserRole role,
      String email,
      bool emailVerified,
      String? photoUrl,
      String displayName,
      bool disabled,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? modifiedAt,
      String createdBy,
      String modifiedBy,
      bool isPremium,
      @TimestampConverter() DateTime? premiumStartDate,
      @TimestampConverter() DateTime? premiumEndDate});
}

/// @nodoc
class _$UserDTOCopyWithImpl<$Res> implements $UserDTOCopyWith<$Res> {
  _$UserDTOCopyWithImpl(this._self, this._then);

  final UserDTO _self;
  final $Res Function(UserDTO) _then;

  /// Create a copy of UserDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? role = null,
    Object? email = null,
    Object? emailVerified = null,
    Object? photoUrl = freezed,
    Object? displayName = null,
    Object? disabled = null,
    Object? createdAt = freezed,
    Object? modifiedAt = freezed,
    Object? createdBy = null,
    Object? modifiedBy = null,
    Object? isPremium = null,
    Object? premiumStartDate = freezed,
    Object? premiumEndDate = freezed,
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
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      disabled: null == disabled
          ? _self.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserDTO extends UserDTO {
  const _UserDTO(
      {this.id = '0',
      required this.uid,
      required this.role,
      required this.email,
      required this.emailVerified,
      required this.photoUrl,
      required this.displayName,
      required this.disabled,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.modifiedAt,
      required this.createdBy,
      required this.modifiedBy,
      required this.isPremium,
      @TimestampConverter() required this.premiumStartDate,
      @TimestampConverter() required this.premiumEndDate})
      : super._();
  factory _UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final String uid;
  @override
  final UserRole role;
  @override
  final String email;
  @override
  final bool emailVerified;
  @override
  final String? photoUrl;
  @override
  final String displayName;
  @override
  final bool disabled;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? modifiedAt;
  @override
  final String createdBy;
  @override
  final String modifiedBy;
  @override
  final bool isPremium;
  @override
  @TimestampConverter()
  final DateTime? premiumStartDate;
  @override
  @TimestampConverter()
  final DateTime? premiumEndDate;

  /// Create a copy of UserDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserDTOCopyWith<_UserDTO> get copyWith =>
      __$UserDTOCopyWithImpl<_UserDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.modifiedBy, modifiedBy) ||
                other.modifiedBy == modifiedBy) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.premiumStartDate, premiumStartDate) ||
                other.premiumStartDate == premiumStartDate) &&
            (identical(other.premiumEndDate, premiumEndDate) ||
                other.premiumEndDate == premiumEndDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uid,
      role,
      email,
      emailVerified,
      photoUrl,
      displayName,
      disabled,
      createdAt,
      modifiedAt,
      createdBy,
      modifiedBy,
      isPremium,
      premiumStartDate,
      premiumEndDate);

  @override
  String toString() {
    return 'UserDTO(id: $id, uid: $uid, role: $role, email: $email, emailVerified: $emailVerified, photoUrl: $photoUrl, displayName: $displayName, disabled: $disabled, createdAt: $createdAt, modifiedAt: $modifiedAt, createdBy: $createdBy, modifiedBy: $modifiedBy, isPremium: $isPremium, premiumStartDate: $premiumStartDate, premiumEndDate: $premiumEndDate)';
  }
}

/// @nodoc
abstract mixin class _$UserDTOCopyWith<$Res> implements $UserDTOCopyWith<$Res> {
  factory _$UserDTOCopyWith(_UserDTO value, $Res Function(_UserDTO) _then) =
      __$UserDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String uid,
      UserRole role,
      String email,
      bool emailVerified,
      String? photoUrl,
      String displayName,
      bool disabled,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? modifiedAt,
      String createdBy,
      String modifiedBy,
      bool isPremium,
      @TimestampConverter() DateTime? premiumStartDate,
      @TimestampConverter() DateTime? premiumEndDate});
}

/// @nodoc
class __$UserDTOCopyWithImpl<$Res> implements _$UserDTOCopyWith<$Res> {
  __$UserDTOCopyWithImpl(this._self, this._then);

  final _UserDTO _self;
  final $Res Function(_UserDTO) _then;

  /// Create a copy of UserDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? role = null,
    Object? email = null,
    Object? emailVerified = null,
    Object? photoUrl = freezed,
    Object? displayName = null,
    Object? disabled = null,
    Object? createdAt = freezed,
    Object? modifiedAt = freezed,
    Object? createdBy = null,
    Object? modifiedBy = null,
    Object? isPremium = null,
    Object? premiumStartDate = freezed,
    Object? premiumEndDate = freezed,
  }) {
    return _then(_UserDTO(
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
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      disabled: null == disabled
          ? _self.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool,
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
    ));
  }
}

// dart format on
