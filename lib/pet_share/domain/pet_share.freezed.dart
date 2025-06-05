// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_share.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PetShare {
  /// Unique identifier of the share.
  String get id;

  /// Identifier of the pet being shared.
  String get petId;

  /// UID of the user receiving access.
  String get userId;

  /// Role granted to the user. Defines allowed actions (viewer, caretaker, coOwner).
  PetShareRole get role;

  /// Optional timestamp (UTC) when this share expires. After the date, access should be revoked.
  DateTime? get expiresAt;

  /// Timestamp (UTC) when the share was created.
  DateTime get createdAt;

  /// UID of the user who created this share. Normally the pet owner or a co-owner.
  String get invitedBy;

  /// Create a copy of PetShare
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PetShareCopyWith<PetShare> get copyWith =>
      _$PetShareCopyWithImpl<PetShare>(this as PetShare, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PetShare &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.petId, petId) || other.petId == petId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.invitedBy, invitedBy) ||
                other.invitedBy == invitedBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, petId, userId, role, expiresAt, createdAt, invitedBy);

  @override
  String toString() {
    return 'PetShare(id: $id, petId: $petId, userId: $userId, role: $role, expiresAt: $expiresAt, createdAt: $createdAt, invitedBy: $invitedBy)';
  }
}

/// @nodoc
abstract mixin class $PetShareCopyWith<$Res> {
  factory $PetShareCopyWith(PetShare value, $Res Function(PetShare) _then) =
      _$PetShareCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String petId,
      String userId,
      PetShareRole role,
      DateTime? expiresAt,
      DateTime createdAt,
      String invitedBy});
}

/// @nodoc
class _$PetShareCopyWithImpl<$Res> implements $PetShareCopyWith<$Res> {
  _$PetShareCopyWithImpl(this._self, this._then);

  final PetShare _self;
  final $Res Function(PetShare) _then;

  /// Create a copy of PetShare
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? petId = null,
    Object? userId = null,
    Object? role = null,
    Object? expiresAt = freezed,
    Object? createdAt = null,
    Object? invitedBy = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      petId: null == petId
          ? _self.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as PetShareRole,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      invitedBy: null == invitedBy
          ? _self.invitedBy
          : invitedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _PetShare extends PetShare {
  const _PetShare(
      {required this.id,
      required this.petId,
      required this.userId,
      required this.role,
      this.expiresAt,
      required this.createdAt,
      required this.invitedBy})
      : super._();

  /// Unique identifier of the share.
  @override
  final String id;

  /// Identifier of the pet being shared.
  @override
  final String petId;

  /// UID of the user receiving access.
  @override
  final String userId;

  /// Role granted to the user. Defines allowed actions (viewer, caretaker, coOwner).
  @override
  final PetShareRole role;

  /// Optional timestamp (UTC) when this share expires. After the date, access should be revoked.
  @override
  final DateTime? expiresAt;

  /// Timestamp (UTC) when the share was created.
  @override
  final DateTime createdAt;

  /// UID of the user who created this share. Normally the pet owner or a co-owner.
  @override
  final String invitedBy;

  /// Create a copy of PetShare
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PetShareCopyWith<_PetShare> get copyWith =>
      __$PetShareCopyWithImpl<_PetShare>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PetShare &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.petId, petId) || other.petId == petId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.invitedBy, invitedBy) ||
                other.invitedBy == invitedBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, petId, userId, role, expiresAt, createdAt, invitedBy);

  @override
  String toString() {
    return 'PetShare(id: $id, petId: $petId, userId: $userId, role: $role, expiresAt: $expiresAt, createdAt: $createdAt, invitedBy: $invitedBy)';
  }
}

/// @nodoc
abstract mixin class _$PetShareCopyWith<$Res>
    implements $PetShareCopyWith<$Res> {
  factory _$PetShareCopyWith(_PetShare value, $Res Function(_PetShare) _then) =
      __$PetShareCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String petId,
      String userId,
      PetShareRole role,
      DateTime? expiresAt,
      DateTime createdAt,
      String invitedBy});
}

/// @nodoc
class __$PetShareCopyWithImpl<$Res> implements _$PetShareCopyWith<$Res> {
  __$PetShareCopyWithImpl(this._self, this._then);

  final _PetShare _self;
  final $Res Function(_PetShare) _then;

  /// Create a copy of PetShare
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? petId = null,
    Object? userId = null,
    Object? role = null,
    Object? expiresAt = freezed,
    Object? createdAt = null,
    Object? invitedBy = null,
  }) {
    return _then(_PetShare(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      petId: null == petId
          ? _self.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as PetShareRole,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      invitedBy: null == invitedBy
          ? _self.invitedBy
          : invitedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
