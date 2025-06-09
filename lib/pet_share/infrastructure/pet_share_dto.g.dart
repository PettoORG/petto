// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_share_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PetShareDTO _$PetShareDTOFromJson(Map<String, dynamic> json) => _PetShareDTO(
      id: json['id'] as String? ?? '0',
      petId: json['petId'] as String,
      userId: json['userId'] as String,
      role: $enumDecode(_$PetShareRoleEnumMap, json['role']),
      expiresAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['expiresAt'], const TimestampConverter().fromJson),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      invitedBy: json['invitedBy'] as String,
    );

Map<String, dynamic> _$PetShareDTOToJson(_PetShareDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'petId': instance.petId,
      'userId': instance.userId,
      'role': _$PetShareRoleEnumMap[instance.role]!,
      'expiresAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.expiresAt, const TimestampConverter().toJson),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'invitedBy': instance.invitedBy,
    };

const _$PetShareRoleEnumMap = {
  PetShareRole.coOwner: 'coOwner',
  PetShareRole.caretaker: 'caretaker',
  PetShareRole.viewer: 'viewer',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
