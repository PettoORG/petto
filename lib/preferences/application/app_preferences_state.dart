import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petto/preferences/domain/app_preferences.dart';

part 'app_preferences_state.freezed.dart';

@freezed
sealed class AppPreferencesState with _$AppPreferencesState {
  const AppPreferencesState._();

  /// Loading a value from appPreferences.
  const factory AppPreferencesState.loading(AppPreferences appPreferences) = _Loading;

  /// Loaded a value from appPreferences.
  const factory AppPreferencesState.data(AppPreferences appPreferences) = _Data;

  /// Failed to load a value from appPreferences.
  const factory AppPreferencesState.failure(AppPreferences appPreferences) = _Failure;
}
