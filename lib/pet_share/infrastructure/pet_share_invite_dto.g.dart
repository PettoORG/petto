// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_share_invite_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PetShareInviteDTO _$PetShareInviteDTOFromJson(Map<String, dynamic> json) =>
    _PetShareInviteDTO(
      id: json['id'] as String? ?? '',
      petId: json['petId'] as String,
      defaultRole: $enumDecode(_$PetShareRoleEnumMap, json['defaultRole']),
      invitedBy: json['invitedBy'] as String,
      expiresAt:
          const TimestampConverter().fromJson(json['expiresAt'] as Timestamp),
      redeemedBy: json['redeemedBy'] as String?,
      redeemedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['redeemedAt'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$PetShareInviteDTOToJson(_PetShareInviteDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'petId': instance.petId,
      'defaultRole': _$PetShareRoleEnumMap[instance.defaultRole]!,
      'invitedBy': instance.invitedBy,
      'expiresAt': const TimestampConverter().toJson(instance.expiresAt),
      'redeemedBy': instance.redeemedBy,
      'redeemedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.redeemedAt, const TimestampConverter().toJson),
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
