import 'package:easy_localization/easy_localization.dart';

enum ReminderType {
  vaccination,
  medication,
  feeding,
  bath,
  grooming,
  walk,
  vetAppointment,
  training,
  deworming,
  weightCheck,
  anniversary,
  other;

  String get displayName => 'reminderTypeEnum.$name'.tr();
}
