import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petto/reminders/domain/reminder.dart';
import 'package:petto/reminders/domain/reminder_frequency.dart';
import 'package:petto/reminders/domain/reminder_type.dart';

part 'reminder_vm.freezed.dart';

/// ViewModel for the Reminder entity.
/// This class is used to manage and manipulate Reminder data in the UI layer.
@freezed
sealed class ReminderVM with _$ReminderVM {
  const ReminderVM._();

  /// Factory constructor for creating a ReminderVM instance.
  const factory ReminderVM({
    required String id,
    required List<String> petIds,
    required List<String> assigneeIds,
    required ReminderType type,
    required String title,
    required String description,
    required DateTime scheduledAt,
    required bool isRecurring,
    required ReminderFrequency frequency,
    required DateTime? recurrenceEndsAt,
  }) = _ReminderVM;

  /// Creates a ReminderVM from a Reminder entity.
  factory ReminderVM.fromEntity(Reminder entity) => ReminderVM(
        id: entity.id,
        petIds: entity.petIds,
        assigneeIds: entity.assigneeIds,
        type: entity.type,
        title: entity.title,
        description: entity.description,
        scheduledAt: entity.scheduledAt,
        isRecurring: entity.isRecurring,
        frequency: entity.frequency,
        recurrenceEndsAt: entity.recurrenceEndsAt,
      );

  /// Creates an empty ReminderVM instance with default values.
  factory ReminderVM.empty() => ReminderVM(
        id: '0',
        petIds: [],
        assigneeIds: [],
        type: ReminderType.other,
        title: '',
        description: '',
        scheduledAt: DateTime.now(),
        isRecurring: false,
        frequency: ReminderFrequency.daily,
        recurrenceEndsAt: null,
      );

  /// Converts the ReminderVM back to a Reminder entity.
  /// Constructs a new Pet object based on the VM fields.
  Reminder toEntity(Reminder entity) => entity.copyWith(
        id: id,
        petIds: petIds,
        assigneeIds: assigneeIds,
        type: type,
        title: title,
        description: description,
        scheduledAt: scheduledAt,
        isRecurring: isRecurring,
        frequency: frequency,
        recurrenceEndsAt: recurrenceEndsAt,
      );
}
