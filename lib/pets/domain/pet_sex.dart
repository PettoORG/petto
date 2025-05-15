import 'package:easy_localization/easy_localization.dart';

enum PetSex {
  male,
  female;

  /// Localized label for UI display.
  String get displayName => 'petSexEnum.$name'.tr();
}
