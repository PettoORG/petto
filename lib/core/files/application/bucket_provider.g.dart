// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bucket_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bucketHash() => r'158e4132bd70c734bc42a3f465f6cbdb086dfc4c';

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

abstract class _$Bucket extends BuildlessAutoDisposeNotifier<String?> {
  late final String family;

  String? build(
    String family,
  );
}

/// Provider for Firebase Storage Bucket. Null for default bucket. Use [family]
/// to re-use the provider.
///
/// Copied from [Bucket].
@ProviderFor(Bucket)
const bucketProvider = BucketFamily();

/// Provider for Firebase Storage Bucket. Null for default bucket. Use [family]
/// to re-use the provider.
///
/// Copied from [Bucket].
class BucketFamily extends Family<String?> {
  /// Provider for Firebase Storage Bucket. Null for default bucket. Use [family]
  /// to re-use the provider.
  ///
  /// Copied from [Bucket].
  const BucketFamily();

  /// Provider for Firebase Storage Bucket. Null for default bucket. Use [family]
  /// to re-use the provider.
  ///
  /// Copied from [Bucket].
  BucketProvider call(
    String family,
  ) {
    return BucketProvider(
      family,
    );
  }

  @override
  BucketProvider getProviderOverride(
    covariant BucketProvider provider,
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
  String? get name => r'bucketProvider';
}

/// Provider for Firebase Storage Bucket. Null for default bucket. Use [family]
/// to re-use the provider.
///
/// Copied from [Bucket].
class BucketProvider extends AutoDisposeNotifierProviderImpl<Bucket, String?> {
  /// Provider for Firebase Storage Bucket. Null for default bucket. Use [family]
  /// to re-use the provider.
  ///
  /// Copied from [Bucket].
  BucketProvider(
    String family,
  ) : this._internal(
          () => Bucket()..family = family,
          from: bucketProvider,
          name: r'bucketProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bucketHash,
          dependencies: BucketFamily._dependencies,
          allTransitiveDependencies: BucketFamily._allTransitiveDependencies,
          family: family,
        );

  BucketProvider._internal(
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
    covariant Bucket notifier,
  ) {
    return notifier.build(
      family,
    );
  }

  @override
  Override overrideWith(Bucket Function() create) {
    return ProviderOverride(
      origin: this,
      override: BucketProvider._internal(
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
  AutoDisposeNotifierProviderElement<Bucket, String?> createElement() {
    return _BucketProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BucketProvider && other.family == family;
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
mixin BucketRef on AutoDisposeNotifierProviderRef<String?> {
  /// The parameter `family` of this provider.
  String get family;
}

class _BucketProviderElement
    extends AutoDisposeNotifierProviderElement<Bucket, String?> with BucketRef {
  _BucketProviderElement(super.provider);

  @override
  String get family => (origin as BucketProvider).family;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
