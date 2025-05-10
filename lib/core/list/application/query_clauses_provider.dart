import 'package:petto/core/list/application/firestore_query_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_clauses_provider.g.dart';

/// Provider para contener una lista de QueryClauses, usualmente para filtrar
/// dinámicamente un Query de Firestore. Dado que es un FamilyProvider, el [id]
/// permite reusar el provider, indicando la "instancia" que se va a usar del
/// QueryClausesProvider.
@riverpod
class QueryClauses extends _$QueryClauses {
  @override
  List<QueryClause> build(String? id) => [];

  /// Adds a new query clause, checking if it already exists.
  void add(QueryClause clause) {
    if (state.contains(clause)) return;
    state = [...state, clause];
  }

  /// Removes all query clauses.
  void clean() => state = [];

  /// Removes a query clause. If query is not found, it does nothing.
  void remove(QueryClause clause) {
    final index = state.indexWhere((c) => c == clause);
    if (index == -1) return;
    state = [...state]..removeAt(index);
  }

  /// Sets a List of Query clauses (remove existing ones).
  void set(List<QueryClause> clauses) => state = clauses;
}
