import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart' as internet;

part 'providers.g.dart';

/// Firestore instance provider.
@Riverpod(keepAlive: true)
FirebaseFirestore firestore(Ref ref) => FirebaseFirestore.instance;

/// Firebase Crashlytics instance provider.
@Riverpod(keepAlive: true)
FirebaseCrashlytics crashlytics(Ref ref) => FirebaseCrashlytics.instance;

/// Provides a Stream of boolean that indicates if the device has internet
/// connection or not.
@Riverpod(keepAlive: true)
Stream<bool> internetConnection(Ref ref) {
  return internet.InternetConnection()
      .onStatusChange
      .map((internetStatus) => internetStatus == internet.InternetStatus.connected);
}
