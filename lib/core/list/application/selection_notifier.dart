import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selection_notifier.g.dart';

/// This provider holds a List of selected items usually from a Grid (or ListView).
/// It asumes that the selected items is a List dynamic. If typecast is required,
/// use ```final selected = next.whereType<MarketplaceProduct>().toList();```.
///
/// Use [family] to reuse the provider.
@riverpod
class SelectionNotifier extends _$SelectionNotifier {
  @override
  List<dynamic> build(String family) => [];

  /// Add an item to the selection.
  void add(dynamic item) {
    if (state.contains(item)) return;
    state = [...state, item];
  }

  /// Remove an item from the selection.
  void remove(dynamic item) {
    final index = state.indexWhere((c) => c == item);
    if (index == -1) return;
    state = [...state]..removeAt(index);
  }

  /// Set the selection.
  void set(List<dynamic> items) => state = items;

  /// Clear the selection.
  void clean() => state = [];
}
