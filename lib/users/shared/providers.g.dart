// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userCollectionPathHash() =>
    r'793a526dcac0e3f08ab4ba21c0a306fa0ec4d1e9';

/// See also [userCollectionPath].
@ProviderFor(userCollectionPath)
final userCollectionPathProvider = Provider<String>.internal(
  userCollectionPath,
  name: r'userCollectionPathProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userCollectionPathHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserCollectionPathRef = ProviderRef<String>;
String _$userFirestoreRepositoryHash() =>
    r'82d277d7f0b8201ba2cf6b4540d8b9fe90fdfbfe';

/// See also [userFirestoreRepository].
@ProviderFor(userFirestoreRepository)
final userFirestoreRepositoryProvider =
    Provider<UserFirestoreRepository>.internal(
  userFirestoreRepository,
  name: r'userFirestoreRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userFirestoreRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserFirestoreRepositoryRef = ProviderRef<UserFirestoreRepository>;
String _$usersQueryHash() => r'82844131745ba6ea4634166de9a73affd6406d2f';

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

/// See also [usersQuery].
@ProviderFor(usersQuery)
const usersQueryProvider = UsersQueryFamily();

/// See also [usersQuery].
class UsersQueryFamily extends Family<Query<User>> {
  /// See also [usersQuery].
  const UsersQueryFamily();

  /// See also [usersQuery].
  UsersQueryProvider call({
    String? family,
    List<QueryClause> clauses = const [],
  }) {
    return UsersQueryProvider(
      family: family,
      clauses: clauses,
    );
  }

  @override
  UsersQueryProvider getProviderOverride(
    covariant UsersQueryProvider provider,
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
  String? get name => r'usersQueryProvider';
}

/// See also [usersQuery].
class UsersQueryProvider extends AutoDisposeProvider<Query<User>> {
  /// See also [usersQuery].
  UsersQueryProvider({
    String? family,
    List<QueryClause> clauses = const [],
  }) : this._internal(
          (ref) => usersQuery(
            ref as UsersQueryRef,
            family: family,
            clauses: clauses,
          ),
          from: usersQueryProvider,
          name: r'usersQueryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$usersQueryHash,
          dependencies: UsersQueryFamily._dependencies,
          allTransitiveDependencies:
              UsersQueryFamily._allTransitiveDependencies,
          family: family,
          clauses: clauses,
        );

  UsersQueryProvider._internal(
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
    Query<User> Function(UsersQueryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UsersQueryProvider._internal(
        (ref) => create(ref as UsersQueryRef),
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
  AutoDisposeProviderElement<Query<User>> createElement() {
    return _UsersQueryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UsersQueryProvider &&
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
mixin UsersQueryRef on AutoDisposeProviderRef<Query<User>> {
  /// The parameter `family` of this provider.
  String? get family;

  /// The parameter `clauses` of this provider.
  List<QueryClause> get clauses;
}

class _UsersQueryProviderElement extends AutoDisposeProviderElement<Query<User>>
    with UsersQueryRef {
  _UsersQueryProviderElement(super.provider);

  @override
  String? get family => (origin as UsersQueryProvider).family;
  @override
  List<QueryClause> get clauses => (origin as UsersQueryProvider).clauses;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
