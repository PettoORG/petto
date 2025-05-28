import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/auth/shared/providers.dart';
import 'package:petto/core/infrastructure/base_firestore_repository.dart';
import 'package:petto/core/list/application/firestore_query_helper.dart';
import 'package:petto/core/list/application/query_clauses_provider.dart';
import 'package:petto/core/list/application/search_notifier.dart';
import 'package:petto/core/shared/providers.dart';
import 'package:petto/pets/domain/pet.dart';
import 'package:petto/pets/infrastructure/pet_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

// Defines the Firestore collection path for pets
@riverpod
String petCollectionPath(Ref ref) => 'pets';

// Provides a repository for Pet entities using Firestore
@riverpod
BaseFirestoreRepository<Pet> petFirestoreRepository(
  Ref ref,
) =>
    BaseFirestoreRepository<Pet>(
      collectionPath: ref.watch(petCollectionPathProvider),
      firestore: ref.watch(firestoreProvider),
      user: ref.watch(userProvider).value!,
      emptyEntity: Pet.empty(),
      fromDomain: (entity) => PetDTO.fromDomain(entity),
      fromDocumentSnapshot: (doc) => PetDTO.fromDocumentSnapshot(doc),
    );

// Constructs a Firestore query for pets with optional filtering by family and clauses
@riverpod
Query<Pet> petsQuery(
  Ref ref, {
  String? family,
  List<QueryClause> clauses = const [],
}) {
  final firestore = ref.watch(firestoreProvider);
  final collectionPath = ref.watch(petCollectionPathProvider);

  // Build the query using FirestoreQueryHelper
  final queryHelper = FirestoreQueryHelper<Pet>(
    ref: firestore.collection(collectionPath),
    fromDomain: (entity) => PetDTO.fromDomain(entity),
    fromDocumentSnapshot: (doc) => PetDTO.fromDocumentSnapshot(doc),
    clauses: [...clauses, ...ref.watch(queryClausesProvider(family))],
    // If family is provided, apply search filtering using searchNotifierProvider
    stringAndField: family != null ? ref.watch(searchNotifierProvider(family)) : null,
  );

  // Returns the constructed query
  return queryHelper.query();
}
