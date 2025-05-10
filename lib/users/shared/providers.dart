import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/core/list/application/firestore_query_helper.dart';
import 'package:petto/core/list/application/query_clauses_provider.dart';
import 'package:petto/core/list/application/search_notifier.dart';
import 'package:petto/core/shared/providers.dart';
import 'package:petto/users/domain/user.dart';
import 'package:petto/users/infrastructure/user_dto.dart';
import 'package:petto/users/infrastructure/user_firestore_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
String userCollectionPath(Ref ref) => 'users';

@Riverpod(keepAlive: true)
UserFirestoreRepository userFirestoreRepository(Ref ref) {
  return UserFirestoreRepository(
    collectionPath: ref.watch(userCollectionPathProvider),
    firestore: ref.watch(firestoreProvider),
  );
}

@riverpod
Query<User> usersQuery(
  Ref ref, {
  String? family,
  List<QueryClause> clauses = const [],
}) {
  final firestore = ref.watch(firestoreProvider);
  final collectionPath = ref.watch(userCollectionPathProvider);
  final queryHelper = FirestoreQueryHelper<User>(
    ref: firestore.collection(collectionPath),
    fromDomain: (entity) => UserDTO.fromDomain(entity),
    fromDocumentSnapshot: (doc) => UserDTO.fromDocumentSnapshot(doc),
    clauses: [...clauses, ...ref.watch(queryClausesProvider(family))],
    stringAndField: family != null ? ref.watch(searchNotifierProvider(family)) : null,
  );

  return queryHelper.query();
}
