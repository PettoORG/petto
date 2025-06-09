import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/auth/shared/providers.dart';
import 'package:petto/core/infrastructure/base_firestore_repository.dart';
import 'package:petto/core/list/application/firestore_query_helper.dart';
import 'package:petto/core/list/application/query_clauses_provider.dart';
import 'package:petto/core/list/application/search_notifier.dart';
import 'package:petto/core/shared/providers.dart';
import 'package:petto/pet_share/domain/pet_share.dart';
import 'package:petto/pet_share/domain/pet_share_invite.dart';
import 'package:petto/pet_share/infrastructure/pet_share_dto.dart';
import 'package:petto/pet_share/infrastructure/pet_share_invite_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

/// Firestore collection path for pet shares.
@riverpod
String petShareCollectionPath(Ref ref) => 'petShares';

/// Repository provider for [PetShare].
@riverpod
BaseFirestoreRepository<PetShare> petShareFirestoreRepository(Ref ref) =>
    BaseFirestoreRepository<PetShare>(
      collectionPath: ref.watch(petShareCollectionPathProvider),
      firestore: ref.watch(firestoreProvider),
      user: ref.watch(userProvider).value!,
      emptyEntity: PetShare.empty(),
      fromDomain: (e) => PetShareDTO.fromDomain(e),
      fromDocumentSnapshot: (doc) => PetShareDTO.fromDocumentSnapshot(doc),
    );

/// Query provider for pet shares.
@riverpod
Query<PetShare> petSharesQuery(
  Ref ref, {
  String? family,
  List<QueryClause> clauses = const [],
}) {
  final firestore = ref.watch(firestoreProvider);
  final collectionPath = ref.watch(petShareCollectionPathProvider);

  final queryHelper = FirestoreQueryHelper<PetShare>(
    ref: firestore.collection(collectionPath),
    fromDomain: (e) => PetShareDTO.fromDomain(e),
    fromDocumentSnapshot: (doc) => PetShareDTO.fromDocumentSnapshot(doc),
    clauses: [...clauses, ...ref.watch(queryClausesProvider(family))],
    stringAndField:
        family != null ? ref.watch(searchNotifierProvider(family)) : null,
  );

  return queryHelper.query();
}

/// Firestore collection path for pet share invites.
@riverpod
String petShareInviteCollectionPath(Ref ref) => 'petShareInvites';

/// Repository provider for [PetShareInvite].
@riverpod
BaseFirestoreRepository<PetShareInvite> petShareInviteFirestoreRepository(
        Ref ref) =>
    BaseFirestoreRepository<PetShareInvite>(
      collectionPath: ref.watch(petShareInviteCollectionPathProvider),
      firestore: ref.watch(firestoreProvider),
      user: ref.watch(userProvider).value!,
      emptyEntity: PetShareInvite.empty(),
      fromDomain: (e) => PetShareInviteDTO.fromDomain(e),
      fromDocumentSnapshot: (doc) =>
          PetShareInviteDTO.fromDocumentSnapshot(doc),
    );

/// Query provider for pet share invites.
@riverpod
Query<PetShareInvite> petShareInvitesQuery(
  Ref ref, {
  String? family,
  List<QueryClause> clauses = const [],
}) {
  final firestore = ref.watch(firestoreProvider);
  final collectionPath = ref.watch(petShareInviteCollectionPathProvider);

  final queryHelper = FirestoreQueryHelper<PetShareInvite>(
    ref: firestore.collection(collectionPath),
    fromDomain: (e) => PetShareInviteDTO.fromDomain(e),
    fromDocumentSnapshot: (doc) =>
        PetShareInviteDTO.fromDocumentSnapshot(doc),
    clauses: [...clauses, ...ref.watch(queryClausesProvider(family))],
    stringAndField:
        family != null ? ref.watch(searchNotifierProvider(family)) : null,
  );

  return queryHelper.query();
}
