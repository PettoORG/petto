// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$storageHash() => r'ee84a5c797d6826309f5194ebc48425f387d56b6';

/// Provider for Firebase Storage instance.
///
/// Copied from [storage].
@ProviderFor(storage)
final storageProvider = Provider<FirebaseStorage>.internal(
  storage,
  name: r'storageProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$storageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StorageRef = ProviderRef<FirebaseStorage>;
String _$fileStorageRepositoryHash() =>
    r'36c685cfd2eaf82d65447372e9a6879999d0f388';

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

/// See also [fileStorageRepository].
@ProviderFor(fileStorageRepository)
const fileStorageRepositoryProvider = FileStorageRepositoryFamily();

/// See also [fileStorageRepository].
class FileStorageRepositoryFamily extends Family<FileStorageRepository> {
  /// See also [fileStorageRepository].
  const FileStorageRepositoryFamily();

  /// See also [fileStorageRepository].
  FileStorageRepositoryProvider call(
    String family,
  ) {
    return FileStorageRepositoryProvider(
      family,
    );
  }

  @override
  FileStorageRepositoryProvider getProviderOverride(
    covariant FileStorageRepositoryProvider provider,
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
  String? get name => r'fileStorageRepositoryProvider';
}

/// See also [fileStorageRepository].
class FileStorageRepositoryProvider
    extends AutoDisposeProvider<FileStorageRepository> {
  /// See also [fileStorageRepository].
  FileStorageRepositoryProvider(
    String family,
  ) : this._internal(
          (ref) => fileStorageRepository(
            ref as FileStorageRepositoryRef,
            family,
          ),
          from: fileStorageRepositoryProvider,
          name: r'fileStorageRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fileStorageRepositoryHash,
          dependencies: FileStorageRepositoryFamily._dependencies,
          allTransitiveDependencies:
              FileStorageRepositoryFamily._allTransitiveDependencies,
          family: family,
        );

  FileStorageRepositoryProvider._internal(
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
  Override overrideWith(
    FileStorageRepository Function(FileStorageRepositoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FileStorageRepositoryProvider._internal(
        (ref) => create(ref as FileStorageRepositoryRef),
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
  AutoDisposeProviderElement<FileStorageRepository> createElement() {
    return _FileStorageRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FileStorageRepositoryProvider && other.family == family;
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
mixin FileStorageRepositoryRef
    on AutoDisposeProviderRef<FileStorageRepository> {
  /// The parameter `family` of this provider.
  String get family;
}

class _FileStorageRepositoryProviderElement
    extends AutoDisposeProviderElement<FileStorageRepository>
    with FileStorageRepositoryRef {
  _FileStorageRepositoryProviderElement(super.provider);

  @override
  String get family => (origin as FileStorageRepositoryProvider).family;
}

String _$fileFirestoreRepositoryHash() =>
    r'8f6fd7c85a9117d39dc0986697c7d2dcca22d224';

/// See also [fileFirestoreRepository].
@ProviderFor(fileFirestoreRepository)
const fileFirestoreRepositoryProvider = FileFirestoreRepositoryFamily();

/// See also [fileFirestoreRepository].
class FileFirestoreRepositoryFamily
    extends Family<BaseFirestoreRepository<AppFile>> {
  /// See also [fileFirestoreRepository].
  const FileFirestoreRepositoryFamily();

  /// See also [fileFirestoreRepository].
  FileFirestoreRepositoryProvider call({
    required String family,
  }) {
    return FileFirestoreRepositoryProvider(
      family: family,
    );
  }

  @override
  FileFirestoreRepositoryProvider getProviderOverride(
    covariant FileFirestoreRepositoryProvider provider,
  ) {
    return call(
      family: provider.family,
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
  String? get name => r'fileFirestoreRepositoryProvider';
}

/// See also [fileFirestoreRepository].
class FileFirestoreRepositoryProvider
    extends AutoDisposeProvider<BaseFirestoreRepository<AppFile>> {
  /// See also [fileFirestoreRepository].
  FileFirestoreRepositoryProvider({
    required String family,
  }) : this._internal(
          (ref) => fileFirestoreRepository(
            ref as FileFirestoreRepositoryRef,
            family: family,
          ),
          from: fileFirestoreRepositoryProvider,
          name: r'fileFirestoreRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fileFirestoreRepositoryHash,
          dependencies: FileFirestoreRepositoryFamily._dependencies,
          allTransitiveDependencies:
              FileFirestoreRepositoryFamily._allTransitiveDependencies,
          family: family,
        );

  FileFirestoreRepositoryProvider._internal(
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
  Override overrideWith(
    BaseFirestoreRepository<AppFile> Function(
            FileFirestoreRepositoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FileFirestoreRepositoryProvider._internal(
        (ref) => create(ref as FileFirestoreRepositoryRef),
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
  AutoDisposeProviderElement<BaseFirestoreRepository<AppFile>> createElement() {
    return _FileFirestoreRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FileFirestoreRepositoryProvider && other.family == family;
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
mixin FileFirestoreRepositoryRef
    on AutoDisposeProviderRef<BaseFirestoreRepository<AppFile>> {
  /// The parameter `family` of this provider.
  String get family;
}

class _FileFirestoreRepositoryProviderElement
    extends AutoDisposeProviderElement<BaseFirestoreRepository<AppFile>>
    with FileFirestoreRepositoryRef {
  _FileFirestoreRepositoryProviderElement(super.provider);

  @override
  String get family => (origin as FileFirestoreRepositoryProvider).family;
}

String _$appFileQueryHash() => r'150692af5b92d87bc9563a463b5e7e293c57a7b7';

/// See also [appFileQuery].
@ProviderFor(appFileQuery)
const appFileQueryProvider = AppFileQueryFamily();

/// See also [appFileQuery].
class AppFileQueryFamily extends Family<Query<AppFile>> {
  /// See also [appFileQuery].
  const AppFileQueryFamily();

  /// See also [appFileQuery].
  AppFileQueryProvider call({
    String? family,
    List<QueryClause> clauses = const [],
  }) {
    return AppFileQueryProvider(
      family: family,
      clauses: clauses,
    );
  }

  @override
  AppFileQueryProvider getProviderOverride(
    covariant AppFileQueryProvider provider,
  ) {
    return call(
      family: provider.family,
      clauses: provider.clauses,
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
  String? get name => r'appFileQueryProvider';
}

/// See also [appFileQuery].
class AppFileQueryProvider extends AutoDisposeProvider<Query<AppFile>> {
  /// See also [appFileQuery].
  AppFileQueryProvider({
    String? family,
    List<QueryClause> clauses = const [],
  }) : this._internal(
          (ref) => appFileQuery(
            ref as AppFileQueryRef,
            family: family,
            clauses: clauses,
          ),
          from: appFileQueryProvider,
          name: r'appFileQueryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appFileQueryHash,
          dependencies: AppFileQueryFamily._dependencies,
          allTransitiveDependencies:
              AppFileQueryFamily._allTransitiveDependencies,
          family: family,
          clauses: clauses,
        );

  AppFileQueryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.family,
    required this.clauses,
  }) : super.internal();

  final String? family;
  final List<QueryClause> clauses;

  @override
  Override overrideWith(
    Query<AppFile> Function(AppFileQueryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AppFileQueryProvider._internal(
        (ref) => create(ref as AppFileQueryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        family: family,
        clauses: clauses,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Query<AppFile>> createElement() {
    return _AppFileQueryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppFileQueryProvider &&
        other.family == family &&
        other.clauses == clauses;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, family.hashCode);
    hash = _SystemHash.combine(hash, clauses.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AppFileQueryRef on AutoDisposeProviderRef<Query<AppFile>> {
  /// The parameter `family` of this provider.
  String? get family;

  /// The parameter `clauses` of this provider.
  List<QueryClause> get clauses;
}

class _AppFileQueryProviderElement
    extends AutoDisposeProviderElement<Query<AppFile>> with AppFileQueryRef {
  _AppFileQueryProviderElement(super.provider);

  @override
  String? get family => (origin as AppFileQueryProvider).family;
  @override
  List<QueryClause> get clauses => (origin as AppFileQueryProvider).clauses;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
