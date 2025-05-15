import 'package:dartz/dartz.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:petto/core/domain/failure.dart';
import 'package:petto/core/form/application/base_entity_notifier.dart';
import 'package:petto/core/form/application/base_entity_state.dart';
import 'package:petto/core/form/application/entity_notifier_mixin.dart';
import 'package:petto/core/form/application/id_provider.dart';
import 'package:petto/core/infrastructure/base_firestore_repository.dart';
import 'package:petto/core/shared/providers.dart';
import 'package:petto/pets/domain/pet.dart';
import 'package:petto/pets/shared/constant.dart';
import 'package:petto/pets/shared/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'pet_notifier.g.dart';

@riverpod
class PetNotifier extends _$PetNotifier with EntityNotifierMixin<Pet> implements BaseEntityNotifier<Pet> {
  @override
  set id(String? id) => ref.read(idProvider(petsModule).notifier).id = id;

  // ignore: avoid_public_notifier_properties
  @override
  bool? get internetConnection => ref.read(internetConnectionProvider).valueOrNull;

  // ignore: avoid_public_notifier_properties
  @override
  BaseFirestoreRepository<Pet> get repository => ref.read(petFirestoreRepositoryProvider);

  // ignore: avoid_public_notifier_properties
  @override
  FirebaseCrashlytics get crashlytics => ref.read(crashlyticsProvider);

  @override
  BaseEntityState<Pet> build() {
    final id = ref.watch(idProvider(petsModule));
    if (id == null) return const BaseEntityState.loading(null);

    sbs.add(
      CombineLatestStream(
        [repository.stream(id), pauseStream.asBroadcastStream()],
        (values) => values[1] as bool == false ? values[0] as Either<Failure, Pet> : null,
      ).listen(
        (failureOrEntity) => loadStreamIntoState(failureOrEntity),
      ),
    );

    ref.onDispose(() async => defaultDispose());

    return const BaseEntityState.loading(null);
  }

  @override
  Future<void> save(Pet entity) => defaultSave(entity);

  @override
  Future<void> create(Pet entity) => defaultCreate(entity);

  @override
  Future<void> update(Pet entity) => defaultUpdate(entity);

  @override
  Future<void> delete(String id) => defaultDelete(id);
}
