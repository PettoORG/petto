import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petto/core/infrastructure/base_dto.dart';
import 'package:petto/core/domain/json_converter/timestamp_converter.dart';
import 'package:petto/reminders/domain/reminder.dart';
import 'package:petto/reminders/domain/reminder_frequency.dart';
import 'package:petto/reminders/domain/reminder_type.dart';
import 'package:petto/users/domain/user.dart';

part 'reminder_dto.freezed.dart';
part 'reminder_dto.g.dart';

@freezed
sealed class ReminderDTO with _$ReminderDTO implements BaseDTO<Reminder> {
  const ReminderDTO._();

  const factory ReminderDTO({
    @Default('0') String id,
    required List<String> petIds,
    required List<String> assigneeIds,
    required ReminderType type,
    required String title,
    required String description,
    @TimestampConverter() required DateTime scheduledAt,
    required bool isRecurring,
    required ReminderFrequency frequency,
    @TimestampConverter() required DateTime? recurrenceEndsAt,
    required bool active,
    @TimestampConverter() required DateTime? createdAt,
    @TimestampConverter() required DateTime? modifiedAt,
    required String createdBy,
    required String modifiedBy,
  }) = _ReminderDTO;

  @Implements<FromDocumentSnapshotFactory>()
  factory ReminderDTO.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return ReminderDTO.fromJson(data).copyWith(id: doc.id);
  }

  @Implements<FromDomainFactory>()
  factory ReminderDTO.fromDomain(Reminder reminder) {
    return ReminderDTO(
      id: reminder.id,
      assigneeIds: reminder.assigneeIds,
      type: reminder.type,
      petIds: reminder.petIds,
      title: reminder.title,
      description: reminder.description,
      scheduledAt: reminder.scheduledAt,
      isRecurring: reminder.isRecurring,
      frequency: reminder.frequency,
      recurrenceEndsAt: reminder.recurrenceEndsAt,
      active: reminder.active,
      createdAt: reminder.createdAt,
      modifiedAt: reminder.modifiedAt,
      createdBy: reminder.createdBy,
      modifiedBy: reminder.modifiedBy,
    );
  }

  @Implements<FromJsonFactory>()
  factory ReminderDTO.fromJson(Map<String, dynamic> json) => _$ReminderDTOFromJson(json);

  @override
  Map<String, dynamic> toDocument() => toJson()..remove('id');

  @override
  Map<String, dynamic> toCreateDocument(User user) {
    final now = DateTime.now();
    return copyWith(
      createdAt: now,
      createdBy: user.uid,
      modifiedAt: now,
      modifiedBy: user.uid,
    ).toDocument();
  }

  @override
  Map<String, dynamic> toUpdateDocument(User user) {
    return copyWith(
      modifiedAt: DateTime.now(),
      modifiedBy: user.uid,
    ).toDocument();
  }

  @override
  Reminder toDomain() {
    return Reminder(
      id: id,
      type: type,
      assigneeIds: assigneeIds,
      petIds: petIds,
      title: title,
      description: description,
      scheduledAt: scheduledAt,
      isRecurring: isRecurring,
      frequency: frequency,
      recurrenceEndsAt: recurrenceEndsAt,
      active: active,
      createdAt: createdAt,
      modifiedAt: modifiedAt,
      createdBy: createdBy,
      modifiedBy: modifiedBy,
    );
  }
}
