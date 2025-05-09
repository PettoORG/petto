import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_preferences.freezed.dart';

/// Enumeration of the keys for the application's preferences.
enum AppPreferencesKeys {
  fcmTokenId,
  fcmTokenRole,
  fcmTokenUid,
  fcmTokenTimestamp,
  pendingAccountLinkingEmail,
  recentMarketplaceSearches,
}

/// Describes the model for the application's preferences (stored in the device's local storage).
/// All fields are optional as they will be loaded progressively when needed.
@freezed
sealed class AppPreferences with _$AppPreferences {
  const AppPreferences._();

  const factory AppPreferences({
    /// Firebase Cloud Messaging (FCM) token for the instance of the application installed on the device.
    required String? fcmTokenId,

    /// The role of the user for whom the FCM token was generated.
    required String? fcmTokenRole,

    /// Unique identifier of the user for whom the FCM token was generated.
    required String? fcmTokenUid,

    /// Date and time when the FCM token was generated.
    required DateTime? fcmTokenTimestamp,

    /// Email that triggered an account linking error during sign-in.
    /// This field is used to store the email in cases where the authentication error is either
    /// 'email-already-in-use' or 'account-exists-with-different-credential'. Once the user
    /// has successfully authenticated, this information is checked and the user is directed to the
    /// account linking flow.
    required String? pendingAccountLinkingEmail,

    /// Recently searched marketplace queries.
    required List<String>? recentMarketplaceSearches,
  }) = _AppPreferences;
}
