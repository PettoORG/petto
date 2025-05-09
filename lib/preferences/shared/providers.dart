import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/preferences/shared/infrastructure/app_preferences_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'providers.g.dart';

/// Provider that holds an instance of [SharedPreferences]. It should not be used
/// directly, but rather through the [AppPreferencesRepository].
///
/// It is initially set to throw an error, but it will be overridden when the
/// application is initialized so that it becomes available.
@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) => throw StateError('Value must be overridden on provider scope');

/// Provider that exposes the getters and setters for the application's preferences.
@Riverpod(keepAlive: true)
AppPreferencesRepository appPreferencesRepository(Ref ref) {
  final sharedPreferences = ref.read(sharedPreferencesProvider);
  return AppPreferencesRepository(sharedPreferences: sharedPreferences);
}
