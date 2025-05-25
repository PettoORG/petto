import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/auth/shared/providers.dart';
import 'package:petto/core/files/application/bucket_provider.dart';
import 'package:petto/core/files/application/files_firestore_path_provider.dart';
import 'package:petto/core/files/application/files_storage_path_provider.dart';
import 'package:petto/core/files/domain/app_file.dart';
import 'package:petto/core/files/infrastructure/app_file_dto.dart';
import 'package:petto/core/files/infrastructure/file_storage_repository.dart';
import 'package:petto/core/infrastructure/base_firestore_repository.dart';
import 'package:petto/core/list/application/firestore_query_helper.dart';
import 'package:petto/core/list/application/query_clauses_provider.dart';
import 'package:petto/core/list/application/search_notifier.dart';
import 'package:petto/core/shared/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

/// Provider for Firebase Storage instance.
@Riverpod(keepAlive: true)
FirebaseStorage storage(Ref ref) => FirebaseStorage.instance;

@riverpod
FileStorageRepository fileStorageRepository(Ref ref, String family) {
  return FileStorageRepository(
    storage: ref.watch(storageProvider),
    storagePath: ref.watch(filesStoragePathProvider(family)),
    bucket: ref.watch(bucketProvider(family)),
  );
}

@riverpod
BaseFirestoreRepository<AppFile> fileFirestoreRepository(
  Ref ref, {
  required String family,
}) {
  final collectionPath = ref.watch(filesFirestorePathProvider(family));

  if (collectionPath == null) {
    throw Exception('Collection path for files is null');
  }

  return BaseFirestoreRepository<AppFile>(
    collectionPath: collectionPath,
    firestore: ref.watch(firestoreProvider),
    user: ref.watch(userProvider).value!,
    emptyEntity: AppFile.empty(),
    fromDomain: (entity) => AppFileDTO.fromDomain(entity),
    fromDocumentSnapshot: (doc) => AppFileDTO.fromDocumentSnapshot(doc),
  );
}

@riverpod
Query<AppFile> appFileQuery(
  Ref ref, {
  String? family,
  List<QueryClause> clauses = const [],
}) {
  final firestore = ref.watch(firestoreProvider);
  final collectionPath = ref.watch(filesStoragePathProvider(family));

  if (collectionPath == null) {
    throw Exception('Collection path for files is null');
  }

  final queryHelper = FirestoreQueryHelper<AppFile>(
    ref: firestore.collection(collectionPath),
    fromDomain: (entity) => AppFileDTO.fromDomain(entity),
    fromDocumentSnapshot: (doc) => AppFileDTO.fromDocumentSnapshot(doc),
    clauses: [...clauses, ...ref.watch(queryClausesProvider(family))],
    stringAndField: family != null ? ref.watch(searchNotifierProvider(family)) : null,
  );

  return queryHelper.query();
}
