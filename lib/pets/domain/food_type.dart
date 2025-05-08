import 'package:easy_localization/easy_localization.dart';

/// Enum for different types of food a pet can consume.
enum FoodType {
  dry,
  wet,
  raw,
  mixed,
  special;

  /// Localized label for UI display.
  String get displayName => 'petFoodTypeEnum.$name'.tr();
}
