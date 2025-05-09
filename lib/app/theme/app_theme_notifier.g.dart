// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_theme_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appThemeNotifierHash() => r'3f792be328f70efbcbd86abd3fe9d626fece8235';

/// Manages the application theme (light or dark) and persists it in preferences.
///
/// Copied from [AppThemeNotifier].
@ProviderFor(AppThemeNotifier)
final appThemeNotifierProvider =
    AutoDisposeAsyncNotifierProvider<AppThemeNotifier, ThemeData>.internal(
  AppThemeNotifier.new,
  name: r'appThemeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appThemeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppThemeNotifier = AutoDisposeAsyncNotifier<ThemeData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
