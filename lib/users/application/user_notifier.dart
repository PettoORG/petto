// lib/users/application/user_notifier.dart
import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:petto/auth/shared/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

import 'package:petto/core/domain/failure.dart';
import 'package:petto/core/form/application/base_entity_state.dart';
import 'package:petto/core/infrastructure/log.dart';
import 'package:petto/core/shared/providers.dart';
import 'package:petto/users/domain/user.dart';
import 'package:petto/users/infrastructure/user_firestore_repository.dart';
import 'package:petto/users/shared/providers.dart';

part 'user_notifier.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  final _subs = <StreamSubscription>[];
  final _pause = BehaviorSubject<bool>.seeded(false);

  UserFirestoreRepository get _repo => ref.read(userFirestoreRepositoryProvider);
  bool? get _internet => ref.read(internetConnectionProvider).valueOrNull;
  FirebaseCrashlytics get _crashlytics => ref.read(crashlyticsProvider);

  @override
  BaseEntityState<User> build() {
    final id = ref.watch(userProvider).value?.id;
    if (id == null) return const BaseEntityState.loading(null);

    _subs.add(
      Rx.combineLatest2<Either<Failure, User>, bool, Either<Failure, User>?>(
        _repo.stream(id),
        _pause.stream,
        (data, paused) => paused ? null : data,
      ).listen(_onStreamData),
    );

    ref.onDispose(_dispose);
    return const BaseEntityState.loading(null);
  }

  Future<void> save(User entity) async {
    if (!_pause.isClosed) _pause.add(true);
    state = BaseEntityState.loading(state.entity?.copyWith());
    await Future.delayed(const Duration(milliseconds: 400));

    if (entity.id == '0') {
      await create(entity);
    } else {
      await update(entity);
    }

    if (!_pause.isClosed) _pause.add(false);
  }

  Future<void> create(User entity) async {
    if (_internet != true) {
      fail(const Failure.network(), recordError: false);
      return;
    }
    final r = await _repo.create(entity);
    r.fold(fail, (_) {});
  }

  Future<void> update(User entity) async {
    if (_internet != true) {
      fail(const Failure.network(), recordError: false);
      return;
    }
    final r = await _repo.update(entity.id, entity);
    r.fold(fail, (_) {});
  }

  Future<void> delete(String id) async {
    if (_internet != true) {
      fail(const Failure.network(), recordError: false);
      return;
    }
    if (!_pause.isClosed) _pause.add(true);
    state = BaseEntityState.loading(state.entity?.copyWith());

    if (id != '0') {
      final r = await _repo.delete(id);
      r.fold(
        fail,
        (_) => state = BaseEntityState.deleted(state.entity?.copyWith()),
      );
    }
  }

  void _onStreamData(Either<Failure, User>? data) {
    if (data == null) return;

    final previous = state.entity?.copyWith();
    data.fold(
      fail,
      (u) {
        if (state is Data<User>) {
          final current = (state as Data<User>).entity;
          if (current != u) state = BaseEntityState.data(u);
        } else {
          state = BaseEntityState.data(u, unchanged: previous == u);
        }
      },
    );
  }

  /// Public failure handler for UI usage
  void fail(Failure f, {bool recordError = true}) {
    state = BaseEntityState.failure(state.entity?.copyWith(), f);
    if (!recordError) return;

    Log.e(f.message, exception: f.cause, stackTrace: f.stackTrace);
    _crashlytics.recordError(f.cause, f.stackTrace, fatal: true);
  }

  Future<void> _dispose() async {
    for (final s in _subs) {
      await s.cancel();
    }
    _subs.clear();
    // No cerrar _pause para evitar 'Bad state' al agregar eventos después de close
  }
}
