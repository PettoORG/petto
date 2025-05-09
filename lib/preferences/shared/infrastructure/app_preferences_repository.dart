import 'package:shared_preferences/shared_preferences.dart';

/// Repository for application preferences.
class AppPreferencesRepository {
  AppPreferencesRepository({
    required this.sharedPreferences,
  });

  /// SharedPreferences instance.
  final SharedPreferences sharedPreferences;

  // /// Saves the pending account linking email in case of authentication errors.
  // /// This email is stored when the error codes 'email-already-in-use' or
  // /// 'account-exists-with-different-credential' occur, so that once the user has successfully
  // /// authenticated, this information can be checked and the user can be directed to the account linking flow.
  // Future<Either<Failure, Unit>> setPendingAccountLinkingEmail(String? email) async {
  //   try {
  //     if (email == null) {
  //       await sharedPreferences.remove(AppPreferencesKeys.pendingAccountLinkingEmail.name);
  //       return right(unit);
  //     }
  //     await sharedPreferences.setString(
  //       AppPreferencesKeys.pendingAccountLinkingEmail.name,
  //       email,
  //     );
  //     return right(unit);
  //   } catch (e) {
  //     return left(
  //       const Failure.unexpected(message: 'Error saving pending account linking email'),
  //     );
  //   }
  // }

  // /// Retrieves the pending account linking email from local storage.
  // Either<Failure, String?> getPendingAccountLinkingEmail() {
  //   try {
  //     final email = sharedPreferences.getString(AppPreferencesKeys.pendingAccountLinkingEmail.name);
  //     return right(email);
  //   } catch (e) {
  //     return left(
  //       const Failure.unexpected(message: 'Error retrieving pending account linking email'),
  //     );
  //   }
  // }

  /// Saves the FCM token for Firebase Cloud Messaging (FCM) in the device's local storage.
  // Future<Either<Failure, Unit>> setFcmToken(FcmToken? fcmToken) async {
  //   try {
  //     if (fcmToken == null) {
  //       await sharedPreferences.remove(AppPreferencesKeys.fcmTokenId.name);
  //       await sharedPreferences.remove(AppPreferencesKeys.fcmTokenRole.name);
  //       await sharedPreferences.remove(AppPreferencesKeys.fcmTokenUid.name);
  //       await sharedPreferences.remove(AppPreferencesKeys.fcmTokenTimestamp.name);
  //       return right(unit);
  //     }

  //     await sharedPreferences.setString(AppPreferencesKeys.fcmTokenId.name, fcmToken.id);
  //     await sharedPreferences.setString(AppPreferencesKeys.fcmTokenRole.name, fcmToken.role);
  //     await sharedPreferences.setString(AppPreferencesKeys.fcmTokenUid.name, fcmToken.uid);
  //     await sharedPreferences.setString(
  //       AppPreferencesKeys.fcmTokenTimestamp.name,
  //       fcmToken.timestamp.toIso8601String(),
  //     );

  //     return right(unit);
  //   } catch (e) {
  //     return left(
  //       const Failure.unexpected(message: 'Error saving FCM token'),
  //     );
  //   }
  // }

  /// Retrieves the FCM token for Firebase Cloud Messaging (FCM) from the device's local storage.
  // Either<Failure, FcmToken?> getFcmToken() {
  //   try {
  //     final id = sharedPreferences.getString(AppPreferencesKeys.fcmTokenId.name);
  //     final role = sharedPreferences.getString(AppPreferencesKeys.fcmTokenRole.name);
  //     final uid = sharedPreferences.getString(AppPreferencesKeys.fcmTokenUid.name);
  //     final timestampString = sharedPreferences.getString(AppPreferencesKeys.fcmTokenTimestamp.name);

  //     if (id == null || role == null || uid == null || timestampString == null) {
  //       return right(null);
  //     }

  //     return right(FcmToken(
  //       id: id,
  //       role: role,
  //       uid: uid,
  //       timestamp: DateTime.parse(timestampString),
  //     ));
  //   } catch (e) {
  //     return left(
  //       const Failure.unexpected(message: 'Error retrieving FCM token'),
  //     );
  //   }
  // }

  /// Saves the list of recent marketplace searches.
  // Future<Either<Failure, Unit>> setRecentMarketplaceSearches(String searchString) async {
  //   try {
  //     final recentSearches = sharedPreferences.getStringList(AppPreferencesKeys.recentMarketplaceSearches.name) ?? [];
  //     final newRecentSearches = [searchString, ...recentSearches].take(7).toList();
  //     await sharedPreferences.setStringList(
  //       AppPreferencesKeys.recentMarketplaceSearches.name,
  //       newRecentSearches,
  //     );
  //     return right(unit);
  //   } catch (e) {
  //     return left(
  //       const Failure.unexpected(
  //         message: 'Error saving recent marketplace searches.',
  //       ),
  //     );
  //   }
  // }

  /// Retrieves the list of recent marketplace searches.
  // Either<Failure, List<String>> getRecentMarketplaceSearches() {
  //   try {
  //     final recentSearches = sharedPreferences.getStringList(AppPreferencesKeys.recentMarketplaceSearches.name);
  //     return right(recentSearches ?? []);
  //   } catch (e) {
  //     return left(
  //       const Failure.unexpected(
  //         message: 'Error retrieving recent marketplace searches.',
  //       ),
  //     );
  //   }
  // }
}
