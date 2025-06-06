import 'package:easy_localization/easy_localization.dart';

/// Represents general size category of the pet.
enum PetSize {
  small,
  medium,
  large;

  /// Localized label for UI display.
  String get displayName => 'PetSizeEnum.$name'.tr();
}
