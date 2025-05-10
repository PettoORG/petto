// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_clauses_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$queryClausesHash() => r'ad3986b651d533c3ac36622481f15af9f55e0e1c';

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

abstract class _$QueryClauses
    extends BuildlessAutoDisposeNotifier<List<QueryClause>> {
  late final String? id;

  List<QueryClause> build(
    String? id,
  );
}

/// Provider para contener una lista de QueryClauses, usualmente para filtrar
/// dinámicamente un Query de Firestore. Dado que es un FamilyProvider, el [id]
/// permite reusar el provider, indicando la "instancia" que se va a usar del
/// QueryClausesProvider.
///
/// Copied from [QueryClauses].
@ProviderFor(QueryClauses)
const queryClausesProvider = QueryClausesFamily();

/// Provider para contener una lista de QueryClauses, usualmente para filtrar
/// dinámicamente un Query de Firestore. Dado que es un FamilyProvider, el [id]
/// permite reusar el provider, indicando la "instancia" que se va a usar del
/// QueryClausesProvider.
///
/// Copied from [QueryClauses].
class QueryClausesFamily extends Family<List<QueryClause>> {
  /// Provider para contener una lista de QueryClauses, usualmente para filtrar
  /// dinámicamente un Query de Firestore. Dado que es un FamilyProvider, el [id]
  /// permite reusar el provider, indicando la "instancia" que se va a usar del
  /// QueryClausesProvider.
  ///
  /// Copied from [QueryClauses].
  const QueryClausesFamily();

  /// Provider para contener una lista de QueryClauses, usualmente para filtrar
  /// dinámicamente un Query de Firestore. Dado que es un FamilyProvider, el [id]
  /// permite reusar el provider, indicando la "instancia" que se va a usar del
  /// QueryClausesProvider.
  ///
  /// Copied from [QueryClauses].
  QueryClausesProvider call(
    String? id,
  ) {
    return QueryClausesProvider(
      id,
    );
  }

  @override
  QueryClausesProvider getProviderOverride(
    covariant QueryClausesProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'queryClausesProvider';
}

/// Provider para contener una lista de QueryClauses, usualmente para filtrar
/// dinámicamente un Query de Firestore. Dado que es un FamilyProvider, el [id]
/// permite reusar el provider, indicando la "instancia" que se va a usar del
/// QueryClausesProvider.
///
/// Copied from [QueryClauses].
class QueryClausesProvider
    extends AutoDisposeNotifierProviderImpl<QueryClauses, List<QueryClause>> {
  /// Provider para contener una lista de QueryClauses, usualmente para filtrar
  /// dinámicamente un Query de Firestore. Dado que es un FamilyProvider, el [id]
  /// permite reusar el provider, indicando la "instancia" que se va a usar del
  /// QueryClausesProvider.
  ///
  /// Copied from [QueryClauses].
  QueryClausesProvider(
    String? id,
  ) : this._internal(
          () => QueryClauses()..id = id,
          from: queryClausesProvider,
          name: r'queryClausesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$queryClausesHash,
          dependencies: QueryClausesFamily._dependencies,
          allTransitiveDependencies:
              QueryClausesFamily._allTransitiveDependencies,
          id: id,
        );

  QueryClausesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String? id;

  @override
  List<QueryClause> runNotifierBuild(
    covariant QueryClauses notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(QueryClauses Function() create) {
    return ProviderOverride(
      origin: this,
      override: QueryClausesProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<QueryClauses, List<QueryClause>>
      createElement() {
    return _QueryClausesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QueryClausesProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin QueryClausesRef on AutoDisposeNotifierProviderRef<List<QueryClause>> {
  /// The parameter `id` of this provider.
  String? get id;
}

class _QueryClausesProviderElement
    extends AutoDisposeNotifierProviderElement<QueryClauses, List<QueryClause>>
    with QueryClausesRef {
  _QueryClausesProviderElement(super.provider);

  @override
  String? get id => (origin as QueryClausesProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
