// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$petCollectionPathHash() => r'79eb7c869b7a94c2a5aeeeaab064ebc47dab830d';

/// See also [petCollectionPath].
@ProviderFor(petCollectionPath)
final petCollectionPathProvider = AutoDisposeProvider<String>.internal(
  petCollectionPath,
  name: r'petCollectionPathProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$petCollectionPathHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PetCollectionPathRef = AutoDisposeProviderRef<String>;
String _$petFirestoreRepositoryHash() =>
    r'eea922090701ffd40ea3e0376d4272fcf9cd6ad7';

/// See also [petFirestoreRepository].
@ProviderFor(petFirestoreRepository)
final petFirestoreRepositoryProvider =
    AutoDisposeProvider<BaseFirestoreRepository<Pet>>.internal(
  petFirestoreRepository,
  name: r'petFirestoreRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$petFirestoreRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PetFirestoreRepositoryRef
    = AutoDisposeProviderRef<BaseFirestoreRepository<Pet>>;
String _$petsQueryHash() => r'b2853b6543c9e21c7d7cb8115ef90b034e0446cf';

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

/// See also [petsQuery].
@ProviderFor(petsQuery)
const petsQueryProvider = PetsQueryFamily();

/// See also [petsQuery].
class PetsQueryFamily extends Family<Query<Pet>> {
  /// See also [petsQuery].
  const PetsQueryFamily();

  /// See also [petsQuery].
  PetsQueryProvider call({
    String? family,
    List<QueryClause> clauses = const [],
  }) {
    return PetsQueryProvider(
      family: family,
      clauses: clauses,
    );
  }

  @override
  PetsQueryProvider getProviderOverride(
    covariant PetsQueryProvider provider,
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
  String? get name => r'petsQueryProvider';
}

/// See also [petsQuery].
class PetsQueryProvider extends AutoDisposeProvider<Query<Pet>> {
  /// See also [petsQuery].
  PetsQueryProvider({
    String? family,
    List<QueryClause> clauses = const [],
  }) : this._internal(
          (ref) => petsQuery(
            ref as PetsQueryRef,
            family: family,
            clauses: clauses,
          ),
          from: petsQueryProvider,
          name: r'petsQueryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$petsQueryHash,
          dependencies: PetsQueryFamily._dependencies,
          allTransitiveDependencies: PetsQueryFamily._allTransitiveDependencies,
          family: family,
          clauses: clauses,
        );

  PetsQueryProvider._internal(
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
    Query<Pet> Function(PetsQueryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PetsQueryProvider._internal(
        (ref) => create(ref as PetsQueryRef),
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
  AutoDisposeProviderElement<Query<Pet>> createElement() {
    return _PetsQueryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PetsQueryProvider &&
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
mixin PetsQueryRef on AutoDisposeProviderRef<Query<Pet>> {
  /// The parameter `family` of this provider.
  String? get family;

  /// The parameter `clauses` of this provider.
  List<QueryClause> get clauses;
}

class _PetsQueryProviderElement extends AutoDisposeProviderElement<Query<Pet>>
    with PetsQueryRef {
  _PetsQueryProviderElement(super.provider);

  @override
  String? get family => (origin as PetsQueryProvider).family;
  @override
  List<QueryClause> get clauses => (origin as PetsQueryProvider).clauses;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
