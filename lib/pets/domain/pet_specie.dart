import 'package:easy_localization/easy_localization.dart';

/// Enum for the most common pet species.
enum PetSpecie {
  dog,
  cat,
  rabbit,
  bird,
  fish,
  other;

  /// Localized label for UI display.
  String get displayName => 'petSpecieEnum.$name'.tr();
}
