// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'touched_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$touchedHash() => r'87b34d20f408bbc303676cd50e25a38a4c2e52cf';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Touched extends BuildlessAutoDisposeNotifier<bool> {
  late final String family;

  bool build(
    String family,
  );
}

/// Provides a boolean that indicates if a widget has been touched or not by the user.
/// Given that it is a FamilyProvider, the [family] allows to re-use the provider,
/// indicating the "instance" that will be used from the Provider. Usually, it is
/// a constant named 'moduleName' to identify the instance of the module.
///
/// Copied from [Touched].
@ProviderFor(Touched)
const touchedProvider = TouchedFamily();

/// Provides a boolean that indicates if a widget has been touched or not by the user.
/// Given that it is a FamilyProvider, the [family] allows to re-use the provider,
/// indicating the "instance" that will be used from the Provider. Usually, it is
/// a constant named 'moduleName' to identify the instance of the module.
///
/// Copied from [Touched].
class TouchedFamily extends Family<bool> {
  /// Provides a boolean that indicates if a widget has been touched or not by the user.
  /// Given that it is a FamilyProvider, the [family] allows to re-use the provider,
  /// indicating the "instance" that will be used from the Provider. Usually, it is
  /// a constant named 'moduleName' to identify the instance of the module.
  ///
  /// Copied from [Touched].
  const TouchedFamily();

  /// Provides a boolean that indicates if a widget has been touched or not by the user.
  /// Given that it is a FamilyProvider, the [family] allows to re-use the provider,
  /// indicating the "instance" that will be used from the Provider. Usually, it is
  /// a constant named 'moduleName' to identify the instance of the module.
  ///
  /// Copied from [Touched].
  TouchedProvider call(
    String family,
  ) {
    return TouchedProvider(
      family,
    );
  }

  @override
  TouchedProvider getProviderOverride(
    covariant TouchedProvider provider,
  ) {
    return call(
      provider.family,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'touchedProvider';
}

/// Provides a boolean that indicates if a widget has been touched or not by the user.
/// Given that it is a FamilyProvider, the [family] allows to re-use the provider,
/// indicating the "instance" that will be used from the Provider. Usually, it is
/// a constant named 'moduleName' to identify the instance of the module.
///
/// Copied from [Touched].
class TouchedProvider extends AutoDisposeNotifierProviderImpl<Touched, bool> {
  /// Provides a boolean that indicates if a widget has been touched or not by the user.
  /// Given that it is a FamilyProvider, the [family] allows to re-use the provider,
  /// indicating the "instance" that will be used from the Provider. Usually, it is
  /// a constant named 'moduleName' to identify the instance of the module.
  ///
  /// Copied from [Touched].
  TouchedProvider(
    String family,
  ) : this._internal(
          () => Touched()..family = family,
          from: touchedProvider,
          name: r'touchedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$touchedHash,
          dependencies: TouchedFamily._dependencies,
          allTransitiveDependencies: TouchedFamily._allTransitiveDependencies,
          family: family,
        );

  TouchedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.family,
  }) : super.internal();

  final String family;

  @override
  bool runNotifierBuild(
    covariant Touched notifier,
  ) {
    return notifier.build(
      family,
    );
  }

  @override
  Override overrideWith(Touched Function() create) {
    return ProviderOverride(
      origin: this,
      override: TouchedProvider._internal(
        () => create()..family = family,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        family: family,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<Touched, bool> createElement() {
    return _TouchedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TouchedProvider && other.family == family;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, family.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TouchedRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `family` of this provider.
  String get family;
}

class _TouchedProviderElement
    extends AutoDisposeNotifierProviderElement<Touched, bool> with TouchedRef {
  _TouchedProviderElement(super.provider);

  @override
  String get family => (origin as TouchedProvider).family;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
