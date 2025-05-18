import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_preferences.freezed.dart';

/// Enumeration of the keys for the application's preferences.
enum AppPreferencesKeys {
  /// The key for the theme preference.
  isDarkTheme,

  /// The key for the language preference.
  languageCode,

  /// The key for the onboarding preference.
  hasSeenOnboarding,
}

/// Describes the model for the application's preferences (stored in the device's local storage).
/// All fields are optional as they will be loaded progressively when needed.
@freezed
sealed class AppPreferences with _$AppPreferences {
  const AppPreferences._();

  const factory AppPreferences({
    required bool? isDarkTheme,
    required String? languageCode,
    required bool? hasSeenOnboarding,
  }) = _AppPreferences;
}
