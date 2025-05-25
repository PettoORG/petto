// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_storage_path_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filesStoragePathHash() => r'bbfa92715ddd7afaf904135842fb574e14657e97';

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

abstract class _$FilesStoragePath
    extends BuildlessAutoDisposeNotifier<String?> {
  late final String? family;

  String? build(
    String? family,
  );
}

/// Provider for Firebase Storage Path to read files.
/// Use [family] to re-use the provider.
///
/// Copied from [FilesStoragePath].
@ProviderFor(FilesStoragePath)
const filesStoragePathProvider = FilesStoragePathFamily();

/// Provider for Firebase Storage Path to read files.
/// Use [family] to re-use the provider.
///
/// Copied from [FilesStoragePath].
class FilesStoragePathFamily extends Family<String?> {
  /// Provider for Firebase Storage Path to read files.
  /// Use [family] to re-use the provider.
  ///
  /// Copied from [FilesStoragePath].
  const FilesStoragePathFamily();

  /// Provider for Firebase Storage Path to read files.
  /// Use [family] to re-use the provider.
  ///
  /// Copied from [FilesStoragePath].
  FilesStoragePathProvider call(
    String? family,
  ) {
    return FilesStoragePathProvider(
      family,
    );
  }

  @override
  FilesStoragePathProvider getProviderOverride(
    covariant FilesStoragePathProvider provider,
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
  String? get name => r'filesStoragePathProvider';
}

/// Provider for Firebase Storage Path to read files.
/// Use [family] to re-use the provider.
///
/// Copied from [FilesStoragePath].
class FilesStoragePathProvider
    extends AutoDisposeNotifierProviderImpl<FilesStoragePath, String?> {
  /// Provider for Firebase Storage Path to read files.
  /// Use [family] to re-use the provider.
  ///
  /// Copied from [FilesStoragePath].
  FilesStoragePathProvider(
    String? family,
  ) : this._internal(
          () => FilesStoragePath()..family = family,
          from: filesStoragePathProvider,
          name: r'filesStoragePathProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filesStoragePathHash,
          dependencies: FilesStoragePathFamily._dependencies,
          allTransitiveDependencies:
              FilesStoragePathFamily._allTransitiveDependencies,
          family: family,
        );

  FilesStoragePathProvider._internal(
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
    covariant FilesStoragePath notifier,
  ) {
    return notifier.build(
      family,
    );
  }

  @override
  Override overrideWith(FilesStoragePath Function() create) {
    return ProviderOverride(
      origin: this,
      override: FilesStoragePathProvider._internal(
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
  AutoDisposeNotifierProviderElement<FilesStoragePath, String?>
      createElement() {
    return _FilesStoragePathProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilesStoragePathProvider && other.family == family;
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
mixin FilesStoragePathRef on AutoDisposeNotifierProviderRef<String?> {
  /// The parameter `family` of this provider.
  String? get family;
}

class _FilesStoragePathProviderElement
    extends AutoDisposeNotifierProviderElement<FilesStoragePath, String?>
    with FilesStoragePathRef {
  _FilesStoragePathProviderElement(super.provider);

  @override
  String? get family => (origin as FilesStoragePathProvider).family;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
