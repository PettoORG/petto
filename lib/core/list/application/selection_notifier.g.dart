// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectionNotifierHash() => r'28127cc8f92bea241e781285573823644b8244d6';

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

abstract class _$SelectionNotifier
    extends BuildlessAutoDisposeNotifier<List<dynamic>> {
  late final String family;

  List<dynamic> build(
    String family,
  );
}

/// This provider holds a List of selected items usually from a Grid (or ListView).
/// It asumes that the selected items is a List<dynamic>. If typecast is required,
/// use ```final selected = next.whereType<MarketplaceProduct>().toList();```.
///
/// Use [family] to reuse the provider.
///
/// Copied from [SelectionNotifier].
@ProviderFor(SelectionNotifier)
const selectionNotifierProvider = SelectionNotifierFamily();

/// This provider holds a List of selected items usually from a Grid (or ListView).
/// It asumes that the selected items is a List<dynamic>. If typecast is required,
/// use ```final selected = next.whereType<MarketplaceProduct>().toList();```.
///
/// Use [family] to reuse the provider.
///
/// Copied from [SelectionNotifier].
class SelectionNotifierFamily extends Family<List<dynamic>> {
  /// This provider holds a List of selected items usually from a Grid (or ListView).
  /// It asumes that the selected items is a List<dynamic>. If typecast is required,
  /// use ```final selected = next.whereType<MarketplaceProduct>().toList();```.
  ///
  /// Use [family] to reuse the provider.
  ///
  /// Copied from [SelectionNotifier].
  const SelectionNotifierFamily();

  /// This provider holds a List of selected items usually from a Grid (or ListView).
  /// It asumes that the selected items is a List<dynamic>. If typecast is required,
  /// use ```final selected = next.whereType<MarketplaceProduct>().toList();```.
  ///
  /// Use [family] to reuse the provider.
  ///
  /// Copied from [SelectionNotifier].
  SelectionNotifierProvider call(
    String family,
  ) {
    return SelectionNotifierProvider(
      family,
    );
  }

  @override
  SelectionNotifierProvider getProviderOverride(
    covariant SelectionNotifierProvider provider,
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
  String? get name => r'selectionNotifierProvider';
}

/// This provider holds a List of selected items usually from a Grid (or ListView).
/// It asumes that the selected items is a List<dynamic>. If typecast is required,
/// use ```final selected = next.whereType<MarketplaceProduct>().toList();```.
///
/// Use [family] to reuse the provider.
///
/// Copied from [SelectionNotifier].
class SelectionNotifierProvider
    extends AutoDisposeNotifierProviderImpl<SelectionNotifier, List<dynamic>> {
  /// This provider holds a List of selected items usually from a Grid (or ListView).
  /// It asumes that the selected items is a List<dynamic>. If typecast is required,
  /// use ```final selected = next.whereType<MarketplaceProduct>().toList();```.
  ///
  /// Use [family] to reuse the provider.
  ///
  /// Copied from [SelectionNotifier].
  SelectionNotifierProvider(
    String family,
  ) : this._internal(
          () => SelectionNotifier()..family = family,
          from: selectionNotifierProvider,
          name: r'selectionNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectionNotifierHash,
          dependencies: SelectionNotifierFamily._dependencies,
          allTransitiveDependencies:
              SelectionNotifierFamily._allTransitiveDependencies,
          family: family,
        );

  SelectionNotifierProvider._internal(
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
  List<dynamic> runNotifierBuild(
    covariant SelectionNotifier notifier,
  ) {
    return notifier.build(
      family,
    );
  }

  @override
  Override overrideWith(SelectionNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: SelectionNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<SelectionNotifier, List<dynamic>>
      createElement() {
    return _SelectionNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectionNotifierProvider && other.family == family;
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
mixin SelectionNotifierRef on AutoDisposeNotifierProviderRef<List<dynamic>> {
  /// The parameter `family` of this provider.
  String get family;
}

class _SelectionNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<SelectionNotifier, List<dynamic>>
    with SelectionNotifierRef {
  _SelectionNotifierProviderElement(super.provider);

  @override
  String get family => (origin as SelectionNotifierProvider).family;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
