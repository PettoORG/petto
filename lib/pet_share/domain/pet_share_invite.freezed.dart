// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_share_invite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PetShareInvite {
  /// Invitation code used as the document ID.
  String get id;

  /// Identifier of the pet that will be shared.
  String get petId;

  /// Role that will be granted upon successful redemption.
  PetShareRole get defaultRole;

  /// UID of the user who generated the invite. Typically matches the pet owner or co-owner.
  String get invitedBy;

  /// Date-time (UTC) when the code becomes unusable. Also leveraged by Firestore TTL for auto-cleanup.
  DateTime get expiresAt;

  /// UID of the user who already redeemed the invite.
  /// Null until the first (and only) successful use.
  /// Guarantees single-use semantics.
  String? get redeemedBy;

  /// Timestamp marking when the code was redeemed.
  /// Null until redemption happens.
  /// Useful for analytics or troubleshooting.
  DateTime? get redeemedAt;

  /// Create a copy of PetShareInvite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PetShareInviteCopyWith<PetShareInvite> get copyWith =>
      _$PetShareInviteCopyWithImpl<PetShareInvite>(
          this as PetShareInvite, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PetShareInvite &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.petId, petId) || other.petId == petId) &&
            (identical(other.defaultRole, defaultRole) ||
                other.defaultRole == defaultRole) &&
            (identical(other.invitedBy, invitedBy) ||
                other.invitedBy == invitedBy) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.redeemedBy, redeemedBy) ||
                other.redeemedBy == redeemedBy) &&
            (identical(other.redeemedAt, redeemedAt) ||
                other.redeemedAt == redeemedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, petId, defaultRole,
      invitedBy, expiresAt, redeemedBy, redeemedAt);

  @override
  String toString() {
    return 'PetShareInvite(id: $id, petId: $petId, defaultRole: $defaultRole, invitedBy: $invitedBy, expiresAt: $expiresAt, redeemedBy: $redeemedBy, redeemedAt: $redeemedAt)';
  }
}

/// @nodoc
abstract mixin class $PetShareInviteCopyWith<$Res> {
  factory $PetShareInviteCopyWith(
          PetShareInvite value, $Res Function(PetShareInvite) _then) =
      _$PetShareInviteCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String petId,
      PetShareRole defaultRole,
      String invitedBy,
      DateTime expiresAt,
      String? redeemedBy,
      DateTime? redeemedAt});
}

/// @nodoc
class _$PetShareInviteCopyWithImpl<$Res>
    implements $PetShareInviteCopyWith<$Res> {
  _$PetShareInviteCopyWithImpl(this._self, this._then);

  final PetShareInvite _self;
  final $Res Function(PetShareInvite) _then;

  /// Create a copy of PetShareInvite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? petId = null,
    Object? defaultRole = null,
    Object? invitedBy = null,
    Object? expiresAt = null,
    Object? redeemedBy = freezed,
    Object? redeemedAt = freezed,
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
      defaultRole: null == defaultRole
          ? _self.defaultRole
          : defaultRole // ignore: cast_nullable_to_non_nullable
              as PetShareRole,
      invitedBy: null == invitedBy
          ? _self.invitedBy
          : invitedBy // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      redeemedBy: freezed == redeemedBy
          ? _self.redeemedBy
          : redeemedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      redeemedAt: freezed == redeemedAt
          ? _self.redeemedAt
          : redeemedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _PetShareInvite extends PetShareInvite {
  const _PetShareInvite(
      {required this.id,
      required this.petId,
      required this.defaultRole,
      required this.invitedBy,
      required this.expiresAt,
      this.redeemedBy,
      this.redeemedAt})
      : super._();

  /// Invitation code used as the document ID.
  @override
  final String id;

  /// Identifier of the pet that will be shared.
  @override
  final String petId;

  /// Role that will be granted upon successful redemption.
  @override
  final PetShareRole defaultRole;

  /// UID of the user who generated the invite. Typically matches the pet owner or co-owner.
  @override
  final String invitedBy;

  /// Date-time (UTC) when the code becomes unusable. Also leveraged by Firestore TTL for auto-cleanup.
  @override
  final DateTime expiresAt;

  /// UID of the user who already redeemed the invite.
  /// Null until the first (and only) successful use.
  /// Guarantees single-use semantics.
  @override
  final String? redeemedBy;

  /// Timestamp marking when the code was redeemed.
  /// Null until redemption happens.
  /// Useful for analytics or troubleshooting.
  @override
  final DateTime? redeemedAt;

  /// Create a copy of PetShareInvite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PetShareInviteCopyWith<_PetShareInvite> get copyWith =>
      __$PetShareInviteCopyWithImpl<_PetShareInvite>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PetShareInvite &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.petId, petId) || other.petId == petId) &&
            (identical(other.defaultRole, defaultRole) ||
                other.defaultRole == defaultRole) &&
            (identical(other.invitedBy, invitedBy) ||
                other.invitedBy == invitedBy) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.redeemedBy, redeemedBy) ||
                other.redeemedBy == redeemedBy) &&
            (identical(other.redeemedAt, redeemedAt) ||
                other.redeemedAt == redeemedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, petId, defaultRole,
      invitedBy, expiresAt, redeemedBy, redeemedAt);

  @override
  String toString() {
    return 'PetShareInvite(id: $id, petId: $petId, defaultRole: $defaultRole, invitedBy: $invitedBy, expiresAt: $expiresAt, redeemedBy: $redeemedBy, redeemedAt: $redeemedAt)';
  }
}

/// @nodoc
abstract mixin class _$PetShareInviteCopyWith<$Res>
    implements $PetShareInviteCopyWith<$Res> {
  factory _$PetShareInviteCopyWith(
          _PetShareInvite value, $Res Function(_PetShareInvite) _then) =
      __$PetShareInviteCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String petId,
      PetShareRole defaultRole,
      String invitedBy,
      DateTime expiresAt,
      String? redeemedBy,
      DateTime? redeemedAt});
}

/// @nodoc
class __$PetShareInviteCopyWithImpl<$Res>
    implements _$PetShareInviteCopyWith<$Res> {
  __$PetShareInviteCopyWithImpl(this._self, this._then);

  final _PetShareInvite _self;
  final $Res Function(_PetShareInvite) _then;

  /// Create a copy of PetShareInvite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? petId = null,
    Object? defaultRole = null,
    Object? invitedBy = null,
    Object? expiresAt = null,
    Object? redeemedBy = freezed,
    Object? redeemedAt = freezed,
  }) {
    return _then(_PetShareInvite(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      petId: null == petId
          ? _self.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as String,
      defaultRole: null == defaultRole
          ? _self.defaultRole
          : defaultRole // ignore: cast_nullable_to_non_nullable
              as PetShareRole,
      invitedBy: null == invitedBy
          ? _self.invitedBy
          : invitedBy // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      redeemedBy: freezed == redeemedBy
          ? _self.redeemedBy
          : redeemedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      redeemedAt: freezed == redeemedAt
          ? _self.redeemedAt
          : redeemedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
