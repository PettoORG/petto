import 'package:petto/core/list/domain/search_string_and_field.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_notifier.g.dart';

/// Notifier for search field.
@Riverpod(keepAlive: true)
class SearchNotifier extends _$SearchNotifier {
  @override
  SearchStringAndField? build(String id) => const SearchStringAndField(
        searchString: null,
        searchField: null,
      );

  void search(String searchString, String searchField) {
    if (state?.searchString != searchString || state?.searchField != searchField) {
      state = SearchStringAndField(
        searchString: searchString,
        searchField: searchField,
      );
    }
  }
}
