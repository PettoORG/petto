import 'package:flutter/material.dart';
import 'package:petto/app/theme/app_theme.dart';
import 'package:petto/preferences/shared/infrastructure/app_preferences_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_theme_notifier.g.dart';

/// Manages the application theme (light or dark) and persists it in preferences.
@riverpod
class AppThemeNotifier extends _$AppThemeNotifier {
  late final AppPreferencesRepository _repository;

  @override
  FutureOr<ThemeData> build() async {
    final prefs = await SharedPreferences.getInstance();
    _repository = AppPreferencesRepository(sharedPreferences: prefs);
    final either = _repository.getIsDarkTheme();
    final isDark = either.fold((_) => false, (value) => value);
    return isDark ? AppTheme.dark() : AppTheme.light();
  }

  /// Returns true if the current theme is dark.
  bool get isDark => state.value == AppTheme.dark();
}
