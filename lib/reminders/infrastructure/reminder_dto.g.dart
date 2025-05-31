// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReminderDTO _$ReminderDTOFromJson(Map<String, dynamic> json) => _ReminderDTO(
      id: json['id'] as String? ?? '0',
      petIds:
          (json['petIds'] as List<dynamic>).map((e) => e as String).toList(),
      assigneeIds: (json['assigneeIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      type: $enumDecode(_$ReminderTypeEnumMap, json['type']),
      title: json['title'] as String,
      description: json['description'] as String,
      scheduledAt:
          const TimestampConverter().fromJson(json['scheduledAt'] as Timestamp),
      isRecurring: json['isRecurring'] as bool,
      frequency: $enumDecode(_$ReminderFrequencyEnumMap, json['frequency']),
      recurrenceEndsAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['recurrenceEndsAt'], const TimestampConverter().fromJson),
      active: json['active'] as bool,
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const TimestampConverter().fromJson),
      modifiedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['modifiedAt'], const TimestampConverter().fromJson),
      createdBy: json['createdBy'] as String,
      modifiedBy: json['modifiedBy'] as String,
    );

Map<String, dynamic> _$ReminderDTOToJson(_ReminderDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'petIds': instance.petIds,
      'assigneeIds': instance.assigneeIds,
      'type': _$ReminderTypeEnumMap[instance.type]!,
      'title': instance.title,
      'description': instance.description,
      'scheduledAt': const TimestampConverter().toJson(instance.scheduledAt),
      'isRecurring': instance.isRecurring,
      'frequency': _$ReminderFrequencyEnumMap[instance.frequency]!,
      'recurrenceEndsAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.recurrenceEndsAt, const TimestampConverter().toJson),
      'active': instance.active,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const TimestampConverter().toJson),
      'modifiedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.modifiedAt, const TimestampConverter().toJson),
      'createdBy': instance.createdBy,
      'modifiedBy': instance.modifiedBy,
    };

const _$ReminderTypeEnumMap = {
  ReminderType.vaccination: 'vaccination',
  ReminderType.medication: 'medication',
  ReminderType.feeding: 'feeding',
  ReminderType.bath: 'bath',
  ReminderType.grooming: 'grooming',
  ReminderType.walk: 'walk',
  ReminderType.vetAppointment: 'vetAppointment',
  ReminderType.training: 'training',
  ReminderType.deworming: 'deworming',
  ReminderType.weightCheck: 'weightCheck',
  ReminderType.anniversary: 'anniversary',
  ReminderType.other: 'other',
};

const _$ReminderFrequencyEnumMap = {
  ReminderFrequency.none: 'none',
  ReminderFrequency.daily: 'daily',
  ReminderFrequency.weekly: 'weekly',
  ReminderFrequency.biweekly: 'biweekly',
  ReminderFrequency.monthly: 'monthly',
  ReminderFrequency.yearly: 'yearly',
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
