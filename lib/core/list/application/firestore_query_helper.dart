import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petto/core/infrastructure/base_dto.dart';
import 'package:petto/core/list/domain/search_string_and_field.dart';

/// Helper class to build Firestore queries. This should be user from a "Query
/// Provider" to dinamically build queries based on other providers.
class FirestoreQueryHelper<T> {
  FirestoreQueryHelper({
    required this.ref,
    required this.fromDomain,
    required this.fromDocumentSnapshot,
    this.clauses = const [],
    this.stringAndField,
  });

  /// Collection reference to build queries from.
  final CollectionReference ref;

  /// Callback to convert a domain entity to a Data Transfer Object.
  final BaseDTO<T> Function(T entity) fromDomain;

  /// Callback to convert a Firestore DocumentSnapshot to Data Transfer Object.
  final BaseDTO<T> Function(DocumentSnapshot snap) fromDocumentSnapshot;

  /// List of query clauses to filter data with. If a QueryClause is [enforced],
  /// it will be enforced in all queries; regular and search queries.
  final List<QueryClause> clauses;

  /// Search string and field for search operations.
  final SearchStringAndField? stringAndField;

  /// Returns a query for given class parameters.
  Query<T> query() {
    // Array that holds query clauses.
    final List<QueryClause> queryClauses = [];

    // Add enforced clauses.
    final enforcedClauses = clauses.where((clause) => clause.enforced);
    queryClauses.addAll(enforcedClauses);

    // Add search clauses.
    final searchString = stringAndField?.searchString ?? '';
    final searchField = stringAndField?.searchField ?? 'title';
    if (searchField.isNotEmpty && searchString.isNotEmpty) {
      final start = searchString;
      final end = '$start\uf8ff';
      queryClauses.addAll([
        Where(searchField, isGreaterThanOrEqualTo: searchString),
        Where(searchField, isLessThan: end),
        OrderBy(searchField, descending: false),
      ]);
    }

    // Add not enfornced clauses (when not searching).
    else {
      final notEnforcedClauses = clauses.where((clause) => !clause.enforced);
      queryClauses.addAll(notEnforcedClauses);
    }

    // Add converters to query.
    Query<T> query = ref.withConverter(
      fromFirestore: (snapshot, options) => fromDocumentSnapshot(snapshot).toDomain(),
      toFirestore: (value, options) => fromDomain(value).toDocument(),
    );

    // Add clauses to query.
    for (var qc in queryClauses) {
      query = qc.query(query);
    }

    return query;
  }
}

/// Abstract class to define a Base Clause. This is how we can define arrays
/// with "query clauses" to build queries dinamically.
abstract class QueryClause {
  /// Defines if the clause is always enforced during query building.
  abstract final bool enforced;

  /// Returns a [Query] for the clause.
  Query<T> query<T>(Query<T> q);
}

/// Limit clause class.
class Limit extends QueryClause {
  Limit(this.limit, {this.enforced = false});

  final int limit;

  @override
  final bool enforced;

  @override
  Query<T> query<T>(Query<T> q) {
    return q.limit(limit);
  }

  @override
  bool operator ==(Object other) {
    return other.runtimeType == runtimeType && (other as Limit).limit == limit && other.enforced == enforced;
  }

  @override
  int get hashCode => limit.hashCode ^ enforced.hashCode;
}

/// OrderBy clause class.
class OrderBy extends QueryClause {
  OrderBy(
    this.field, {
    this.descending = false,
    this.enforced = false,
  });

  String field;

  bool descending;

  @override
  final bool enforced;

  @override
  Query<T> query<T>(Query<T> q) {
    return q.orderBy(field, descending: descending);
  }

  @override
  bool operator ==(Object other) {
    return other.runtimeType == runtimeType &&
        (other as OrderBy).field == field &&
        other.descending == descending &&
        other.enforced == enforced;
  }

  @override
  int get hashCode => field.hashCode ^ descending.hashCode ^ enforced.hashCode;
}

/// Where clause class.
class Where extends QueryClause {
  Where(
    this.field, {
    this.isEqualTo,
    this.isNotEqualTo,
    this.isLessThan,
    this.isLessThanOrEqualTo,
    this.isGreaterThan,
    this.isGreaterThanOrEqualTo,
    this.arrayContains,
    this.arrayContainsAny,
    this.whereIn,
    this.whereNotIn,
    this.isNull,
    this.enforced = false,
  });

  String field;
  Object? isEqualTo;
  Object? isNotEqualTo;
  Object? isLessThan;
  Object? isLessThanOrEqualTo;
  Object? isGreaterThan;
  Object? isGreaterThanOrEqualTo;
  Object? arrayContains;
  Iterable<Object?>? arrayContainsAny;
  Iterable<Object?>? whereIn;
  Iterable<Object?>? whereNotIn;
  bool? isNull;

  @override
  final bool enforced;

  @override
  Query<T> query<T>(Query<T> q) {
    if (isEqualTo != null) return q.where(field, isEqualTo: isEqualTo);
    if (isNotEqualTo != null) return q.where(field, isNotEqualTo: isNotEqualTo);
    if (isLessThan != null) return q.where(field, isLessThan: isLessThan);
    if (isLessThanOrEqualTo != null) {
      return q.where(field, isLessThanOrEqualTo: isLessThanOrEqualTo);
    }
    if (isGreaterThan != null) {
      return q.where(field, isGreaterThan: isGreaterThan);
    }
    if (isGreaterThanOrEqualTo != null) {
      return q.where(field, isGreaterThanOrEqualTo: isGreaterThanOrEqualTo);
    }
    if (arrayContains != null) {
      return q.where(field, arrayContains: arrayContains);
    }
    if (arrayContainsAny != null) {
      return q.where(field, arrayContainsAny: arrayContainsAny);
    }
    if (whereIn != null) return q.where(field, whereIn: whereIn);
    if (whereNotIn != null) return q.where(field, whereNotIn: whereNotIn);
    if (isNull != null) return q.where(field, isNull: isNull);

    throw Exception('Not valid where clause');
  }

  @override
  bool operator ==(Object other) {
    return other.runtimeType == runtimeType &&
        (other as Where).field == field &&
        other.isEqualTo == isEqualTo &&
        other.isNotEqualTo == isNotEqualTo &&
        other.isLessThan == isLessThan &&
        other.isLessThanOrEqualTo == isLessThanOrEqualTo &&
        other.isGreaterThan == isGreaterThan &&
        other.isGreaterThanOrEqualTo == isGreaterThanOrEqualTo &&
        other.arrayContains == arrayContains &&
        other.arrayContainsAny == arrayContainsAny &&
        other.whereIn == whereIn &&
        other.whereNotIn == whereNotIn &&
        other.isNull == isNull &&
        other.enforced == enforced;
  }

  @override
  int get hashCode =>
      field.hashCode ^
      isEqualTo.hashCode ^
      isNotEqualTo.hashCode ^
      isLessThan.hashCode ^
      isLessThanOrEqualTo.hashCode ^
      isGreaterThan.hashCode ^
      isGreaterThanOrEqualTo.hashCode ^
      arrayContains.hashCode ^
      arrayContainsAny.hashCode ^
      whereIn.hashCode ^
      whereNotIn.hashCode ^
      isNull.hashCode ^
      enforced.hashCode;
}

/// Enum with Available Where Clauses.
enum WhereClauseType {
  isEqualTo,
  isNotEqualTo,
  isLessThan,
  isLessThanOrEqualTo,
  isGreaterThan,
  isGreaterThanOrEqualTo,
  arrayContains,
  arrayContainsAny,
  whereIn,
  whereNotIn,
  isNull,
}
