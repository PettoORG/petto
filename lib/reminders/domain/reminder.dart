import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petto/reminders/domain/reminder_frequency.dart';
import 'package:petto/reminders/domain/reminder_type.dart';

part 'reminder.freezed.dart';

/// Reminder model for the Pet Care App.
/// Can be linked to one, many or no pets. Supports recurrence and scheduling.

@freezed
sealed class Reminder with _$Reminder {
  const Reminder._();

  const factory Reminder({
    /// Document ID in the database.
    required String id,

    /// List of pet IDs the reminder applies to. Can be empty for general reminders.
    required List<String> petIds,

    /// List of user IDs assigned to receive the reminder. Useful when pets are shared.
    required List<String> assigneeIds,

    /// Reminder type (e.g., "Vaccine", "Bath").
    required ReminderType type,

    /// Reminder title (e.g., "Rabies vaccine", "Monthly bath").
    required String title,

    /// Additional notes or instructions.
    required String description,

    /// Date and time when the reminder is scheduled.
    required DateTime scheduledAt,

    /// Whether the reminder repeats over time.
    required bool isRecurring,

    /// Recurrence frequency type.
    required ReminderFrequency frequency,

    /// Optional end date for the recurrence.
    required DateTime? recurrenceEndsAt,

    /// Whether the reminder is currently active.
    required bool active,

    /// Record creation timestamp.
    required DateTime? createdAt,

    /// Last modification timestamp.
    required DateTime? modifiedAt,

    /// UID of the user who created the record.
    required String createdBy,

    /// UID of the user who last modified the record.
    required String modifiedBy,
  }) = _Reminder;

  factory Reminder.empty() => Reminder(
        id: '0',
        petIds: [],
        assigneeIds: [],
        type: ReminderType.other,
        title: '',
        description: '',
        scheduledAt: DateTime.now(),
        isRecurring: false,
        frequency: ReminderFrequency.none,
        recurrenceEndsAt: null,
        active: true,
        createdAt: DateTime.now(),
        modifiedAt: DateTime.now(),
        createdBy: '',
        modifiedBy: '',
      );
}
