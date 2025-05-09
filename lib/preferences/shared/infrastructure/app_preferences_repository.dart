import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:petto/core/domain/failure.dart';
import 'package:petto/preferences/shared/domain/app_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Repository for application preferences.
class AppPreferencesRepository {
  AppPreferencesRepository({
    required this.sharedPreferences,
  });

  /// SharedPreferences instance.
  final SharedPreferences sharedPreferences;

  /// Saves whether the dark theme is enabled.
  Future<Either<Failure, Unit>> setIsDarkTheme(bool isDarkTheme) async {
    try {
      await sharedPreferences.setBool(
        AppPreferencesKeys.isDarkTheme.name,
        isDarkTheme,
      );
      return right(unit);
    } catch (_) {
      return left(
        Failure.unexpected(message: 'savingThemePreference'.tr()),
      );
    }
  }

  /// Retrieves whether the dark theme is enabled. Defaults to false.
  Either<Failure, bool> getIsDarkTheme() {
    try {
      final value = sharedPreferences.getBool(AppPreferencesKeys.isDarkTheme.name);
      return right(value ?? false);
    } catch (_) {
      return left(
        Failure.unexpected(message: 'retrievingThemePreference'.tr()),
      );
    }
  }

  /// Saves the current language code (e.g. 'es', 'en').
  Future<Either<Failure, Unit>> setLanguageCode(String code) async {
    try {
      await sharedPreferences.setString(
        AppPreferencesKeys.languageCode.name,
        code,
      );
      return right(unit);
    } catch (_) {
      return left(
        Failure.unexpected(message: 'savingLanguageCode'.tr()),
      );
    }
  }

  /// Retrieves the saved language code. Defaults to 'es'.
  Either<Failure, String> getLanguageCode() {
    try {
      final value = sharedPreferences.getString(AppPreferencesKeys.languageCode.name);
      return right(value ?? 'es');
    } catch (_) {
      return left(
        Failure.unexpected(message: 'retrievingLanguageCode'.tr()),
      );
    }
  }
}
