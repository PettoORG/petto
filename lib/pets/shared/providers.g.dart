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
String _$paymentsQueryHash() => r'9f8cbfafe774c4f0905def8cdbf524f6566a10d3';

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

/// See also [paymentsQuery].
@ProviderFor(paymentsQuery)
const paymentsQueryProvider = PaymentsQueryFamily();

/// See also [paymentsQuery].
class PaymentsQueryFamily extends Family<Query<Pet>> {
  /// See also [paymentsQuery].
  const PaymentsQueryFamily();

  /// See also [paymentsQuery].
  PaymentsQueryProvider call({
    String? family,
    List<QueryClause> clauses = const [],
  }) {
    return PaymentsQueryProvider(
      family: family,
      clauses: clauses,
    );
  }

  @override
  PaymentsQueryProvider getProviderOverride(
    covariant PaymentsQueryProvider provider,
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
  String? get name => r'paymentsQueryProvider';
}

/// See also [paymentsQuery].
class PaymentsQueryProvider extends AutoDisposeProvider<Query<Pet>> {
  /// See also [paymentsQuery].
  PaymentsQueryProvider({
    String? family,
    List<QueryClause> clauses = const [],
  }) : this._internal(
          (ref) => paymentsQuery(
            ref as PaymentsQueryRef,
            family: family,
            clauses: clauses,
          ),
          from: paymentsQueryProvider,
          name: r'paymentsQueryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paymentsQueryHash,
          dependencies: PaymentsQueryFamily._dependencies,
          allTransitiveDependencies:
              PaymentsQueryFamily._allTransitiveDependencies,
          family: family,
          clauses: clauses,
        );

  PaymentsQueryProvider._internal(
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
    Query<Pet> Function(PaymentsQueryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PaymentsQueryProvider._internal(
        (ref) => create(ref as PaymentsQueryRef),
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
    return _PaymentsQueryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaymentsQueryProvider &&
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
mixin PaymentsQueryRef on AutoDisposeProviderRef<Query<Pet>> {
  /// The parameter `family` of this provider.
  String? get family;

  /// The parameter `clauses` of this provider.
  List<QueryClause> get clauses;
}

class _PaymentsQueryProviderElement
    extends AutoDisposeProviderElement<Query<Pet>> with PaymentsQueryRef {
  _PaymentsQueryProviderElement(super.provider);

  @override
  String? get family => (origin as PaymentsQueryProvider).family;
  @override
  List<QueryClause> get clauses => (origin as PaymentsQueryProvider).clauses;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
