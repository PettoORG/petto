import 'package:dartz/dartz.dart';
import 'package:petto/preferences/shared/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:petto/preferences/domain/app_preferences.dart';
import 'package:petto/preferences/application/app_preferences_state.dart';

part 'app_preferences_notifier.g.dart';

@Riverpod(keepAlive: true)
class AppPreferencesNotifier extends _$AppPreferencesNotifier {
  @override
  AppPreferencesState build() {
    // Default preferences
    const defaultPrefs = AppPreferences(
      isDarkTheme: false,
      languageCode: 'es',
      hasSeenOnboarding: false,
    );

    final repo = ref.read(appPreferencesRepositoryProvider);

    // Load theme preference
    final themeOrFailure = repo.getIsDarkTheme();
    final isDarkTheme = themeOrFailure.fold((_) => null, id);
    if (isDarkTheme == null) {
      return AppPreferencesState.failure(defaultPrefs);
    }

    // Load language preference
    final langOrFailure = repo.getLanguageCode();
    final languageCode = langOrFailure.fold((_) => null, id);
    if (languageCode == null) {
      return AppPreferencesState.failure(
        defaultPrefs.copyWith(isDarkTheme: isDarkTheme),
      );
    }

    // Load onboarding preference
    final seenOrFailure = repo.getHasSeenOnboarding();
    final hasSeenOnboarding = seenOrFailure.fold((_) => null, id);
    if (hasSeenOnboarding == null) {
      return AppPreferencesState.failure(
        defaultPrefs.copyWith(
          isDarkTheme: isDarkTheme,
          languageCode: languageCode,
        ),
      );
    }

    // All preferences loaded successfully
    return AppPreferencesState.data(
      defaultPrefs.copyWith(
        isDarkTheme: isDarkTheme,
        languageCode: languageCode,
        hasSeenOnboarding: hasSeenOnboarding,
      ),
    );
  }

  /// Update dark theme preference
  Future<void> setIsDarkTheme(bool isDark) async {
    final repo = ref.read(appPreferencesRepositoryProvider);
    final result = await repo.setIsDarkTheme(isDark);
    result.fold(
      (_) => state = AppPreferencesState.failure(state.appPreferences),
      (_) => state = AppPreferencesState.data(
        state.appPreferences.copyWith(isDarkTheme: isDark),
      ),
    );
  }

  /// Update language code preference
  Future<void> setLanguageCode(String code) async {
    final repo = ref.read(appPreferencesRepositoryProvider);
    final result = await repo.setLanguageCode(code);
    result.fold(
      (_) => state = AppPreferencesState.failure(state.appPreferences),
      (_) => state = AppPreferencesState.data(
        state.appPreferences.copyWith(languageCode: code),
      ),
    );
  }

  /// Update onboarding seen preference
  Future<void> setHasSeenOnboarding(bool seen) async {
    final repo = ref.read(appPreferencesRepositoryProvider);
    final result = await repo.setHasSeenOnboarding(seen);
    result.fold(
      (_) => state = AppPreferencesState.failure(state.appPreferences),
      (_) => state = AppPreferencesState.data(
        state.appPreferences.copyWith(hasSeenOnboarding: seen),
      ),
    );
  }
}
