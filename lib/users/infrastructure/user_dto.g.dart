// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => _UserDTO(
      id: json['id'] as String? ?? '0',
      uid: json['uid'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      email: json['email'] as String,
      emailVerified: json['emailVerified'] as bool,
      photoUrl: json['photoUrl'] as String?,
      displayName: json['displayName'] as String,
      disabled: json['disabled'] as bool,
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const TimestampConverter().fromJson),
      modifiedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['modifiedAt'], const TimestampConverter().fromJson),
      createdBy: json['createdBy'] as String,
      modifiedBy: json['modifiedBy'] as String,
      isPremium: json['isPremium'] as bool,
      premiumStartDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['premiumStartDate'], const TimestampConverter().fromJson),
      premiumEndDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['premiumEndDate'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$UserDTOToJson(_UserDTO instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'role': _$UserRoleEnumMap[instance.role]!,
      'email': instance.email,
      'emailVerified': instance.emailVerified,
      'photoUrl': instance.photoUrl,
      'displayName': instance.displayName,
      'disabled': instance.disabled,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const TimestampConverter().toJson),
      'modifiedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.modifiedAt, const TimestampConverter().toJson),
      'createdBy': instance.createdBy,
      'modifiedBy': instance.modifiedBy,
      'isPremium': instance.isPremium,
      'premiumStartDate': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.premiumStartDate, const TimestampConverter().toJson),
      'premiumEndDate': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.premiumEndDate, const TimestampConverter().toJson),
    };

const _$UserRoleEnumMap = {
  UserRole.petOwner: 'petOwner',
  UserRole.admin: 'admin',
  UserRole.guest: 'guest',
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
