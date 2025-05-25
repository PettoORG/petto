// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_firestore_path_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filesFirestorePathHash() =>
    r'd8f9d32d89d3d38db4a1c5dd1cf0d73d823fcef8';

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

abstract class _$FilesFirestorePath
    extends BuildlessAutoDisposeNotifier<String?> {
  late final String? family;

  String? build(
    String? family,
  );
}

/// Provider for Firebase Firestore Path to read files.
/// Use [family] to re-use the provider.
///
/// Copied from [FilesFirestorePath].
@ProviderFor(FilesFirestorePath)
const filesFirestorePathProvider = FilesFirestorePathFamily();

/// Provider for Firebase Firestore Path to read files.
/// Use [family] to re-use the provider.
///
/// Copied from [FilesFirestorePath].
class FilesFirestorePathFamily extends Family<String?> {
  /// Provider for Firebase Firestore Path to read files.
  /// Use [family] to re-use the provider.
  ///
  /// Copied from [FilesFirestorePath].
  const FilesFirestorePathFamily();

  /// Provider for Firebase Firestore Path to read files.
  /// Use [family] to re-use the provider.
  ///
  /// Copied from [FilesFirestorePath].
  FilesFirestorePathProvider call(
    String? family,
  ) {
    return FilesFirestorePathProvider(
      family,
    );
  }

  @override
  FilesFirestorePathProvider getProviderOverride(
    covariant FilesFirestorePathProvider provider,
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
  String? get name => r'filesFirestorePathProvider';
}

/// Provider for Firebase Firestore Path to read files.
/// Use [family] to re-use the provider.
///
/// Copied from [FilesFirestorePath].
class FilesFirestorePathProvider
    extends AutoDisposeNotifierProviderImpl<FilesFirestorePath, String?> {
  /// Provider for Firebase Firestore Path to read files.
  /// Use [family] to re-use the provider.
  ///
  /// Copied from [FilesFirestorePath].
  FilesFirestorePathProvider(
    String? family,
  ) : this._internal(
          () => FilesFirestorePath()..family = family,
          from: filesFirestorePathProvider,
          name: r'filesFirestorePathProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filesFirestorePathHash,
          dependencies: FilesFirestorePathFamily._dependencies,
          allTransitiveDependencies:
              FilesFirestorePathFamily._allTransitiveDependencies,
          family: family,
        );

  FilesFirestorePathProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.family,
  }) : super.internal();

  final String? family;

  @override
  String? runNotifierBuild(
    covariant FilesFirestorePath notifier,
  ) {
    return notifier.build(
      family,
    );
  }

  @override
  Override overrideWith(FilesFirestorePath Function() create) {
    return ProviderOverride(
      origin: this,
      override: FilesFirestorePathProvider._internal(
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
  AutoDisposeNotifierProviderElement<FilesFirestorePath, String?>
      createElement() {
    return _FilesFirestorePathProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilesFirestorePathProvider && other.family == family;
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
mixin FilesFirestorePathRef on AutoDisposeNotifierProviderRef<String?> {
  /// The parameter `family` of this provider.
  String? get family;
}

class _FilesFirestorePathProviderElement
    extends AutoDisposeNotifierProviderElement<FilesFirestorePath, String?>
    with FilesFirestorePathRef {
  _FilesFirestorePathProviderElement(super.provider);

  @override
  String? get family => (origin as FilesFirestorePathProvider).family;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
