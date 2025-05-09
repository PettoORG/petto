// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'id_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$idHash() => r'442edd4c3a8ac80fc9ce7ab8d792aed33f1d1692';

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

abstract class _$Id extends BuildlessAutoDisposeNotifier<String?> {
  late final String family;

  String? build(
    String family,
  );
}

/// Provides a string that indicates the id of the document (or record) selected.
/// Given that it is a FamilyProvider, the [family] allows to re-use the provider,
/// indicating the "instance" that will be used from the Provider. Usually, it is
/// a constant named 'moduleName' to identify the instance of the module.
///
/// Copied from [Id].
@ProviderFor(Id)
const idProvider = IdFamily();

/// Provides a string that indicates the id of the document (or record) selected.
/// Given that it is a FamilyProvider, the [family] allows to re-use the provider,
/// indicating the "instance" that will be used from the Provider. Usually, it is
/// a constant named 'moduleName' to identify the instance of the module.
///
/// Copied from [Id].
class IdFamily extends Family<String?> {
  /// Provides a string that indicates the id of the document (or record) selected.
  /// Given that it is a FamilyProvider, the [family] allows to re-use the provider,
  /// indicating the "instance" that will be used from the Provider. Usually, it is
  /// a constant named 'moduleName' to identify the instance of the module.
  ///
  /// Copied from [Id].
  const IdFamily();

  /// Provides a string that indicates the id of the document (or record) selected.
  /// Given that it is a FamilyProvider, the [family] allows to re-use the provider,
  /// indicating the "instance" that will be used from the Provider. Usually, it is
  /// a constant named 'moduleName' to identify the instance of the module.
  ///
  /// Copied from [Id].
  IdProvider call(
    String family,
  ) {
    return IdProvider(
      family,
    );
  }

  @override
  IdProvider getProviderOverride(
    covariant IdProvider provider,
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
  String? get name => r'idProvider';
}

/// Provides a string that indicates the id of the document (or record) selected.
/// Given that it is a FamilyProvider, the [family] allows to re-use the provider,
/// indicating the "instance" that will be used from the Provider. Usually, it is
/// a constant named 'moduleName' to identify the instance of the module.
///
/// Copied from [Id].
class IdProvider extends AutoDisposeNotifierProviderImpl<Id, String?> {
  /// Provides a string that indicates the id of the document (or record) selected.
  /// Given that it is a FamilyProvider, the [family] allows to re-use the provider,
  /// indicating the "instance" that will be used from the Provider. Usually, it is
  /// a constant named 'moduleName' to identify the instance of the module.
  ///
  /// Copied from [Id].
  IdProvider(
    String family,
  ) : this._internal(
          () => Id()..family = family,
          from: idProvider,
          name: r'idProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$idHash,
          dependencies: IdFamily._dependencies,
          allTransitiveDependencies: IdFamily._allTransitiveDependencies,
          family: family,
        );

  IdProvider._internal(
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
  String? runNotifierBuild(
    covariant Id notifier,
  ) {
    return notifier.build(
      family,
    );
  }

  @override
  Override overrideWith(Id Function() create) {
    return ProviderOverride(
      origin: this,
      override: IdProvider._internal(
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
  AutoDisposeNotifierProviderElement<Id, String?> createElement() {
    return _IdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IdProvider && other.family == family;
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
mixin IdRef on AutoDisposeNotifierProviderRef<String?> {
  /// The parameter `family` of this provider.
  String get family;
}

class _IdProviderElement extends AutoDisposeNotifierProviderElement<Id, String?>
    with IdRef {
  _IdProviderElement(super.provider);

  @override
  String get family => (origin as IdProvider).family;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
