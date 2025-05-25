// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filesNotifierHash() => r'7058964ef901a1d0ef66c942b1388d44ac9cc344';

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

abstract class _$FilesNotifier
    extends BuildlessAutoDisposeNotifier<FilesState> {
  late final String family;

  FilesState build(
    String family,
  );
}

/// See also [FilesNotifier].
@ProviderFor(FilesNotifier)
const filesNotifierProvider = FilesNotifierFamily();

/// See also [FilesNotifier].
class FilesNotifierFamily extends Family<FilesState> {
  /// See also [FilesNotifier].
  const FilesNotifierFamily();

  /// See also [FilesNotifier].
  FilesNotifierProvider call(
    String family,
  ) {
    return FilesNotifierProvider(
      family,
    );
  }

  @override
  FilesNotifierProvider getProviderOverride(
    covariant FilesNotifierProvider provider,
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
  String? get name => r'filesNotifierProvider';
}

/// See also [FilesNotifier].
class FilesNotifierProvider
    extends AutoDisposeNotifierProviderImpl<FilesNotifier, FilesState> {
  /// See also [FilesNotifier].
  FilesNotifierProvider(
    String family,
  ) : this._internal(
          () => FilesNotifier()..family = family,
          from: filesNotifierProvider,
          name: r'filesNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filesNotifierHash,
          dependencies: FilesNotifierFamily._dependencies,
          allTransitiveDependencies:
              FilesNotifierFamily._allTransitiveDependencies,
          family: family,
        );

  FilesNotifierProvider._internal(
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
  FilesState runNotifierBuild(
    covariant FilesNotifier notifier,
  ) {
    return notifier.build(
      family,
    );
  }

  @override
  Override overrideWith(FilesNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: FilesNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<FilesNotifier, FilesState>
      createElement() {
    return _FilesNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilesNotifierProvider && other.family == family;
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
mixin FilesNotifierRef on AutoDisposeNotifierProviderRef<FilesState> {
  /// The parameter `family` of this provider.
  String get family;
}

class _FilesNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<FilesNotifier, FilesState>
    with FilesNotifierRef {
  _FilesNotifierProviderElement(super.provider);

  @override
  String get family => (origin as FilesNotifierProvider).family;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
