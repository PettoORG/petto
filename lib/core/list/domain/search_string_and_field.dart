/// Describes a pair of SearchString and SearchField to build a search query
/// for firestore.
class SearchStringAndField {
  const SearchStringAndField({
    required this.searchString,
    required this.searchField,
  });

  final String? searchString;
  final String? searchField;
}
