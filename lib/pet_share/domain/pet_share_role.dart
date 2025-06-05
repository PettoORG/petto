import 'package:easy_localization/easy_localization.dart';

/// User role granted through a PetShare.
/// Determines the level of access the guest has over a pet.
enum PetShareRole {
  coOwner, // Full rights, same as main owner
  caretaker, // Can update care-related data
  viewer; // Read-only

  /// Localized label for UI display.
  String get displayName => 'petShareRoleEnum.$name'.tr();
}
