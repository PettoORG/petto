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

/// Firestore collection path for pet shares.
final petShareCollectionPathProvider =
    Provider<String>((ref) => 'petShares');

/// Repository provider for [PetShare].
final petShareFirestoreRepositoryProvider =
    Provider<BaseFirestoreRepository<PetShare>>((ref) {
  return BaseFirestoreRepository<PetShare>(
    collectionPath: ref.watch(petShareCollectionPathProvider),
    firestore: ref.watch(firestoreProvider),
    user: ref.watch(userProvider).value!,
    emptyEntity: PetShare.empty(),
    fromDomain: (e) => PetShareDTO.fromDomain(e),
    fromDocumentSnapshot: (doc) => PetShareDTO.fromDocumentSnapshot(doc),
  );
});

/// Parameters for [petSharesQueryProvider].
class PetSharesQueryParams {
  const PetSharesQueryParams({this.family, this.clauses = const []});
  final String? family;
  final List<QueryClause> clauses;
}

/// Query provider for pet shares.
final petSharesQueryProvider = AutoDisposeProvider.family<Query<PetShare>,
    PetSharesQueryParams>((ref, params) {
  final firestore = ref.watch(firestoreProvider);
  final collectionPath = ref.watch(petShareCollectionPathProvider);

  final queryHelper = FirestoreQueryHelper<PetShare>(
    ref: firestore.collection(collectionPath),
    fromDomain: (e) => PetShareDTO.fromDomain(e),
    fromDocumentSnapshot: (doc) => PetShareDTO.fromDocumentSnapshot(doc),
    clauses: [...params.clauses, ...ref.watch(queryClausesProvider(params.family))],
    stringAndField:
        params.family != null ? ref.watch(searchNotifierProvider(params.family)) : null,
  );

  return queryHelper.query();
});

/// Firestore collection path for pet share invites.
final petShareInviteCollectionPathProvider =
    Provider<String>((ref) => 'petShareInvites');

/// Repository provider for [PetShareInvite].
final petShareInviteFirestoreRepositoryProvider =
    Provider<BaseFirestoreRepository<PetShareInvite>>((ref) {
  return BaseFirestoreRepository<PetShareInvite>(
    collectionPath: ref.watch(petShareInviteCollectionPathProvider),
    firestore: ref.watch(firestoreProvider),
    user: ref.watch(userProvider).value!,
    emptyEntity: PetShareInvite.empty(),
    fromDomain: (e) => PetShareInviteDTO.fromDomain(e),
    fromDocumentSnapshot: (doc) =>
        PetShareInviteDTO.fromDocumentSnapshot(doc),
  );
});

/// Parameters for [petShareInvitesQueryProvider].
class PetShareInvitesQueryParams {
  const PetShareInvitesQueryParams({this.family, this.clauses = const []});
  final String? family;
  final List<QueryClause> clauses;
}

/// Query provider for pet share invites.
final petShareInvitesQueryProvider = AutoDisposeProvider.family<
    Query<PetShareInvite>, PetShareInvitesQueryParams>((ref, params) {
  final firestore = ref.watch(firestoreProvider);
  final collectionPath = ref.watch(petShareInviteCollectionPathProvider);

  final queryHelper = FirestoreQueryHelper<PetShareInvite>(
    ref: firestore.collection(collectionPath),
    fromDomain: (e) => PetShareInviteDTO.fromDomain(e),
    fromDocumentSnapshot: (doc) =>
        PetShareInviteDTO.fromDocumentSnapshot(doc),
    clauses: [...params.clauses, ...ref.watch(queryClausesProvider(params.family))],
    stringAndField:
        params.family != null ? ref.watch(searchNotifierProvider(params.family)) : null,
  );

  return queryHelper.query();
});
