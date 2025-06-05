import 'package:easy_localization/easy_localization.dart';

enum ReminderFrequency {
  none,
  daily,
  weekly,
  biweekly,
  monthly,
  yearly;

  String get displayName => 'reminderFrequencyEnum.$name'.tr();
}
