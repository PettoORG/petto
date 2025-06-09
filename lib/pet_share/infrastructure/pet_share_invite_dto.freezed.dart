// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_share_invite_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PetShareInviteDTO {
  String get id;
  String get petId;
  PetShareRole get defaultRole;
  String get invitedBy;
  @TimestampConverter()
  DateTime get expiresAt;
  String? get redeemedBy;
  @TimestampConverter()
  DateTime? get redeemedAt;

  /// Create a copy of PetShareInviteDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PetShareInviteDTOCopyWith<PetShareInviteDTO> get copyWith =>
      _$PetShareInviteDTOCopyWithImpl<PetShareInviteDTO>(
          this as PetShareInviteDTO, _$identity);

  /// Serializes this PetShareInviteDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PetShareInviteDTO &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, petId, defaultRole,
      invitedBy, expiresAt, redeemedBy, redeemedAt);

  @override
  String toString() {
    return 'PetShareInviteDTO(id: $id, petId: $petId, defaultRole: $defaultRole, invitedBy: $invitedBy, expiresAt: $expiresAt, redeemedBy: $redeemedBy, redeemedAt: $redeemedAt)';
  }
}

/// @nodoc
abstract mixin class $PetShareInviteDTOCopyWith<$Res> {
  factory $PetShareInviteDTOCopyWith(
          PetShareInviteDTO value, $Res Function(PetShareInviteDTO) _then) =
      _$PetShareInviteDTOCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String petId,
      PetShareRole defaultRole,
      String invitedBy,
      @TimestampConverter() DateTime expiresAt,
      String? redeemedBy,
      @TimestampConverter() DateTime? redeemedAt});
}

/// @nodoc
class _$PetShareInviteDTOCopyWithImpl<$Res>
    implements $PetShareInviteDTOCopyWith<$Res> {
  _$PetShareInviteDTOCopyWithImpl(this._self, this._then);

  final PetShareInviteDTO _self;
  final $Res Function(PetShareInviteDTO) _then;

  /// Create a copy of PetShareInviteDTO
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
@JsonSerializable()
class _PetShareInviteDTO extends PetShareInviteDTO {
  const _PetShareInviteDTO(
      {this.id = '',
      required this.petId,
      required this.defaultRole,
      required this.invitedBy,
      @TimestampConverter() required this.expiresAt,
      this.redeemedBy,
      @TimestampConverter() this.redeemedAt})
      : super._();
  factory _PetShareInviteDTO.fromJson(Map<String, dynamic> json) =>
      _$PetShareInviteDTOFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final String petId;
  @override
  final PetShareRole defaultRole;
  @override
  final String invitedBy;
  @override
  @TimestampConverter()
  final DateTime expiresAt;
  @override
  final String? redeemedBy;
  @override
  @TimestampConverter()
  final DateTime? redeemedAt;

  /// Create a copy of PetShareInviteDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PetShareInviteDTOCopyWith<_PetShareInviteDTO> get copyWith =>
      __$PetShareInviteDTOCopyWithImpl<_PetShareInviteDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PetShareInviteDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PetShareInviteDTO &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, petId, defaultRole,
      invitedBy, expiresAt, redeemedBy, redeemedAt);

  @override
  String toString() {
    return 'PetShareInviteDTO(id: $id, petId: $petId, defaultRole: $defaultRole, invitedBy: $invitedBy, expiresAt: $expiresAt, redeemedBy: $redeemedBy, redeemedAt: $redeemedAt)';
  }
}

/// @nodoc
abstract mixin class _$PetShareInviteDTOCopyWith<$Res>
    implements $PetShareInviteDTOCopyWith<$Res> {
  factory _$PetShareInviteDTOCopyWith(
          _PetShareInviteDTO value, $Res Function(_PetShareInviteDTO) _then) =
      __$PetShareInviteDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String petId,
      PetShareRole defaultRole,
      String invitedBy,
      @TimestampConverter() DateTime expiresAt,
      String? redeemedBy,
      @TimestampConverter() DateTime? redeemedAt});
}

/// @nodoc
class __$PetShareInviteDTOCopyWithImpl<$Res>
    implements _$PetShareInviteDTOCopyWith<$Res> {
  __$PetShareInviteDTOCopyWithImpl(this._self, this._then);

  final _PetShareInviteDTO _self;
  final $Res Function(_PetShareInviteDTO) _then;

  /// Create a copy of PetShareInviteDTO
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
    return _then(_PetShareInviteDTO(
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
