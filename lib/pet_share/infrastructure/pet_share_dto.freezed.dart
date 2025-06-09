// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_share_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PetShareDTO {
  String get id;
  String get petId;
  String get userId;
  PetShareRole get role;
  @TimestampConverter()
  DateTime? get expiresAt;
  @TimestampConverter()
  DateTime get createdAt;
  String get invitedBy;

  /// Create a copy of PetShareDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PetShareDTOCopyWith<PetShareDTO> get copyWith =>
      _$PetShareDTOCopyWithImpl<PetShareDTO>(this as PetShareDTO, _$identity);

  /// Serializes this PetShareDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PetShareDTO &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, petId, userId, role, expiresAt, createdAt, invitedBy);

  @override
  String toString() {
    return 'PetShareDTO(id: $id, petId: $petId, userId: $userId, role: $role, expiresAt: $expiresAt, createdAt: $createdAt, invitedBy: $invitedBy)';
  }
}

/// @nodoc
abstract mixin class $PetShareDTOCopyWith<$Res> {
  factory $PetShareDTOCopyWith(
          PetShareDTO value, $Res Function(PetShareDTO) _then) =
      _$PetShareDTOCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String petId,
      String userId,
      PetShareRole role,
      @TimestampConverter() DateTime? expiresAt,
      @TimestampConverter() DateTime createdAt,
      String invitedBy});
}

/// @nodoc
class _$PetShareDTOCopyWithImpl<$Res> implements $PetShareDTOCopyWith<$Res> {
  _$PetShareDTOCopyWithImpl(this._self, this._then);

  final PetShareDTO _self;
  final $Res Function(PetShareDTO) _then;

  /// Create a copy of PetShareDTO
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
@JsonSerializable()
class _PetShareDTO extends PetShareDTO {
  const _PetShareDTO(
      {this.id = '0',
      required this.petId,
      required this.userId,
      required this.role,
      @TimestampConverter() this.expiresAt,
      @TimestampConverter() required this.createdAt,
      required this.invitedBy})
      : super._();
  factory _PetShareDTO.fromJson(Map<String, dynamic> json) =>
      _$PetShareDTOFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final String petId;
  @override
  final String userId;
  @override
  final PetShareRole role;
  @override
  @TimestampConverter()
  final DateTime? expiresAt;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  final String invitedBy;

  /// Create a copy of PetShareDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PetShareDTOCopyWith<_PetShareDTO> get copyWith =>
      __$PetShareDTOCopyWithImpl<_PetShareDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PetShareDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PetShareDTO &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, petId, userId, role, expiresAt, createdAt, invitedBy);

  @override
  String toString() {
    return 'PetShareDTO(id: $id, petId: $petId, userId: $userId, role: $role, expiresAt: $expiresAt, createdAt: $createdAt, invitedBy: $invitedBy)';
  }
}

/// @nodoc
abstract mixin class _$PetShareDTOCopyWith<$Res>
    implements $PetShareDTOCopyWith<$Res> {
  factory _$PetShareDTOCopyWith(
          _PetShareDTO value, $Res Function(_PetShareDTO) _then) =
      __$PetShareDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String petId,
      String userId,
      PetShareRole role,
      @TimestampConverter() DateTime? expiresAt,
      @TimestampConverter() DateTime createdAt,
      String invitedBy});
}

/// @nodoc
class __$PetShareDTOCopyWithImpl<$Res> implements _$PetShareDTOCopyWith<$Res> {
  __$PetShareDTOCopyWithImpl(this._self, this._then);

  final _PetShareDTO _self;
  final $Res Function(_PetShareDTO) _then;

  /// Create a copy of PetShareDTO
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
    return _then(_PetShareDTO(
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
