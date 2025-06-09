// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$petShareCollectionPathHash() =>
    r'42def380596a6856701d43e3020923a071b54c9c';

/// Firestore collection path for pet shares.
///
/// Copied from [petShareCollectionPath].
@ProviderFor(petShareCollectionPath)
final petShareCollectionPathProvider = AutoDisposeProvider<String>.internal(
  petShareCollectionPath,
  name: r'petShareCollectionPathProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$petShareCollectionPathHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PetShareCollectionPathRef = AutoDisposeProviderRef<String>;
String _$petShareFirestoreRepositoryHash() =>
    r'478b565a64341be920ce1317ba6d62c566943743';

/// Repository provider for [PetShare].
///
/// Copied from [petShareFirestoreRepository].
@ProviderFor(petShareFirestoreRepository)
final petShareFirestoreRepositoryProvider =
    AutoDisposeProvider<BaseFirestoreRepository<PetShare>>.internal(
  petShareFirestoreRepository,
  name: r'petShareFirestoreRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$petShareFirestoreRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PetShareFirestoreRepositoryRef
    = AutoDisposeProviderRef<BaseFirestoreRepository<PetShare>>;
String _$petSharesQueryHash() => r'1e99273bf886f4d4952c0b13fab7dfa02e4ff11a';

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

/// Query provider for pet shares.
///
/// Copied from [petSharesQuery].
@ProviderFor(petSharesQuery)
const petSharesQueryProvider = PetSharesQueryFamily();

/// Query provider for pet shares.
///
/// Copied from [petSharesQuery].
class PetSharesQueryFamily extends Family<Query<PetShare>> {
  /// Query provider for pet shares.
  ///
  /// Copied from [petSharesQuery].
  const PetSharesQueryFamily();

  /// Query provider for pet shares.
  ///
  /// Copied from [petSharesQuery].
  PetSharesQueryProvider call({
    String? family,
    List<QueryClause> clauses = const [],
  }) {
    return PetSharesQueryProvider(
      family: family,
      clauses: clauses,
    );
  }

  @override
  PetSharesQueryProvider getProviderOverride(
    covariant PetSharesQueryProvider provider,
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
  String? get name => r'petSharesQueryProvider';
}

/// Query provider for pet shares.
///
/// Copied from [petSharesQuery].
class PetSharesQueryProvider extends AutoDisposeProvider<Query<PetShare>> {
  /// Query provider for pet shares.
  ///
  /// Copied from [petSharesQuery].
  PetSharesQueryProvider({
    String? family,
    List<QueryClause> clauses = const [],
  }) : this._internal(
          (ref) => petSharesQuery(
            ref as PetSharesQueryRef,
            family: family,
            clauses: clauses,
          ),
          from: petSharesQueryProvider,
          name: r'petSharesQueryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$petSharesQueryHash,
          dependencies: PetSharesQueryFamily._dependencies,
          allTransitiveDependencies:
              PetSharesQueryFamily._allTransitiveDependencies,
          family: family,
          clauses: clauses,
        );

  PetSharesQueryProvider._internal(
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
    Query<PetShare> Function(PetSharesQueryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PetSharesQueryProvider._internal(
        (ref) => create(ref as PetSharesQueryRef),
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
  AutoDisposeProviderElement<Query<PetShare>> createElement() {
    return _PetSharesQueryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PetSharesQueryProvider &&
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
mixin PetSharesQueryRef on AutoDisposeProviderRef<Query<PetShare>> {
  /// The parameter `family` of this provider.
  String? get family;

  /// The parameter `clauses` of this provider.
  List<QueryClause> get clauses;
}

class _PetSharesQueryProviderElement
    extends AutoDisposeProviderElement<Query<PetShare>> with PetSharesQueryRef {
  _PetSharesQueryProviderElement(super.provider);

  @override
  String? get family => (origin as PetSharesQueryProvider).family;
  @override
  List<QueryClause> get clauses => (origin as PetSharesQueryProvider).clauses;
}

String _$petShareInviteCollectionPathHash() =>
    r'9db79503700f0144b8f895a63201a20affd13089';

/// Firestore collection path for pet share invites.
///
/// Copied from [petShareInviteCollectionPath].
@ProviderFor(petShareInviteCollectionPath)
final petShareInviteCollectionPathProvider =
    AutoDisposeProvider<String>.internal(
  petShareInviteCollectionPath,
  name: r'petShareInviteCollectionPathProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$petShareInviteCollectionPathHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PetShareInviteCollectionPathRef = AutoDisposeProviderRef<String>;
String _$petShareInviteFirestoreRepositoryHash() =>
    r'77c8acc402d37f2d8228fa2c3a8e67ce04ae3970';

/// Repository provider for [PetShareInvite].
///
/// Copied from [petShareInviteFirestoreRepository].
@ProviderFor(petShareInviteFirestoreRepository)
final petShareInviteFirestoreRepositoryProvider =
    AutoDisposeProvider<BaseFirestoreRepository<PetShareInvite>>.internal(
  petShareInviteFirestoreRepository,
  name: r'petShareInviteFirestoreRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$petShareInviteFirestoreRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PetShareInviteFirestoreRepositoryRef
    = AutoDisposeProviderRef<BaseFirestoreRepository<PetShareInvite>>;
String _$petShareInvitesQueryHash() =>
    r'4b0856f586ef27ef4febea10f894aa41166167e9';

/// Query provider for pet share invites.
///
/// Copied from [petShareInvitesQuery].
@ProviderFor(petShareInvitesQuery)
const petShareInvitesQueryProvider = PetShareInvitesQueryFamily();

/// Query provider for pet share invites.
///
/// Copied from [petShareInvitesQuery].
class PetShareInvitesQueryFamily extends Family<Query<PetShareInvite>> {
  /// Query provider for pet share invites.
  ///
  /// Copied from [petShareInvitesQuery].
  const PetShareInvitesQueryFamily();

  /// Query provider for pet share invites.
  ///
  /// Copied from [petShareInvitesQuery].
  PetShareInvitesQueryProvider call({
    String? family,
    List<QueryClause> clauses = const [],
  }) {
    return PetShareInvitesQueryProvider(
      family: family,
      clauses: clauses,
    );
  }

  @override
  PetShareInvitesQueryProvider getProviderOverride(
    covariant PetShareInvitesQueryProvider provider,
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
  String? get name => r'petShareInvitesQueryProvider';
}

/// Query provider for pet share invites.
///
/// Copied from [petShareInvitesQuery].
class PetShareInvitesQueryProvider
    extends AutoDisposeProvider<Query<PetShareInvite>> {
  /// Query provider for pet share invites.
  ///
  /// Copied from [petShareInvitesQuery].
  PetShareInvitesQueryProvider({
    String? family,
    List<QueryClause> clauses = const [],
  }) : this._internal(
          (ref) => petShareInvitesQuery(
            ref as PetShareInvitesQueryRef,
            family: family,
            clauses: clauses,
          ),
          from: petShareInvitesQueryProvider,
          name: r'petShareInvitesQueryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$petShareInvitesQueryHash,
          dependencies: PetShareInvitesQueryFamily._dependencies,
          allTransitiveDependencies:
              PetShareInvitesQueryFamily._allTransitiveDependencies,
          family: family,
          clauses: clauses,
        );

  PetShareInvitesQueryProvider._internal(
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
    Query<PetShareInvite> Function(PetShareInvitesQueryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PetShareInvitesQueryProvider._internal(
        (ref) => create(ref as PetShareInvitesQueryRef),
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
  AutoDisposeProviderElement<Query<PetShareInvite>> createElement() {
    return _PetShareInvitesQueryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PetShareInvitesQueryProvider &&
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
mixin PetShareInvitesQueryRef on AutoDisposeProviderRef<Query<PetShareInvite>> {
  /// The parameter `family` of this provider.
  String? get family;

  /// The parameter `clauses` of this provider.
  List<QueryClause> get clauses;
}

class _PetShareInvitesQueryProviderElement
    extends AutoDisposeProviderElement<Query<PetShareInvite>>
    with PetShareInvitesQueryRef {
  _PetShareInvitesQueryProviderElement(super.provider);

  @override
  String? get family => (origin as PetShareInvitesQueryProvider).family;
  @override
  List<QueryClause> get clauses =>
      (origin as PetShareInvitesQueryProvider).clauses;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
