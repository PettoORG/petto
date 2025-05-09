// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPreferencesHash() => r'e24afbf55fff54f11d66a3695ca4d28f07c32963';

/// Provider that holds an instance of [SharedPreferences]. It should not be used
/// directly, but rather through the [AppPreferencesRepository].
///
/// It is initially set to throw an error, but it will be overridden when the
/// application is initialized so that it becomes available.
///
/// Copied from [sharedPreferences].
@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = Provider<SharedPreferences>.internal(
  sharedPreferences,
  name: r'sharedPreferencesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedPreferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SharedPreferencesRef = ProviderRef<SharedPreferences>;
String _$appPreferencesRepositoryHash() =>
    r'25bfa915c51913d7d66a1c2bd3d1b317bf76bb9f';

/// Provider that exposes the getters and setters for the application's preferences.
///
/// Copied from [appPreferencesRepository].
@ProviderFor(appPreferencesRepository)
final appPreferencesRepositoryProvider =
    Provider<AppPreferencesRepository>.internal(
  appPreferencesRepository,
  name: r'appPreferencesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appPreferencesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppPreferencesRepositoryRef = ProviderRef<AppPreferencesRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
