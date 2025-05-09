// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firestoreHash() => r'864285def6284159b44f9598dcde96347e0c1dce';

/// Firestore instance provider.
///
/// Copied from [firestore].
@ProviderFor(firestore)
final firestoreProvider = Provider<FirebaseFirestore>.internal(
  firestore,
  name: r'firestoreProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firestoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirestoreRef = ProviderRef<FirebaseFirestore>;
String _$crashlyticsHash() => r'155108b0d2e2c244304ed72e1be15318f2f933c5';

/// Firebase Crashlytics instance provider.
///
/// Copied from [crashlytics].
@ProviderFor(crashlytics)
final crashlyticsProvider = Provider<FirebaseCrashlytics>.internal(
  crashlytics,
  name: r'crashlyticsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$crashlyticsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CrashlyticsRef = ProviderRef<FirebaseCrashlytics>;
String _$internetConnectionHash() =>
    r'b97a1f73791f341b8949879ab96294a586e60d51';

/// Provides a Stream of boolean that indicates if the device has internet
/// connection or not.
///
/// Copied from [internetConnection].
@ProviderFor(internetConnection)
final internetConnectionProvider = StreamProvider<bool>.internal(
  internetConnection,
  name: r'internetConnectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$internetConnectionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef InternetConnectionRef = StreamProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
