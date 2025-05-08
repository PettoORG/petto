import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// Main User model for the Pet Care App.
/// Used for authentication, subscriptions, and profile-related functionalities.

@freezed
sealed class User with _$User {
  const User._();

  const factory User({
    /// Document ID in the database. Typically same as [uid].
    required String id,

    /// Firebase Authentication UID.
    required String uid,

    /// Date and time when the user record was created.
    required DateTime? createdAt,

    /// Date and time of the last update to the user record.
    required DateTime? modifiedAt,

    /// UID of the user who created this record.
    required String createdBy,

    /// UID of the user who last modified this record.
    required String modifiedBy,

    /// Full name of the user.
    required String displayName,

    /// User email address (used for login and communication).
    required String email,

    /// Whether the user's email is verified.
    required bool emailVerified,

    /// Optional user profile image URL.
    required String? photoUrl,

    /// User phone number for contact or alerts.
    required String phoneNumber,

    /// Whether the user account is currently disabled.
    required bool disabled,

    /// Date and time of the user's last login.
    required DateTime? lastLogin,

    /// Whether the user has an active premium subscription.
    required bool isPremium,

    /// Start date of the current premium subscription (if any).
    required DateTime? premiumStartDate,

    /// End date of the current premium subscription (if any).
    required DateTime? premiumEndDate,
  }) = _User;

  /// Returns an empty/default User instance.
  factory User.empty() => User(
        id: '0',
        uid: '',
        createdAt: DateTime.now(),
        modifiedAt: DateTime.now(),
        createdBy: '',
        modifiedBy: '',
        displayName: '',
        email: '',
        emailVerified: false,
        photoUrl: null,
        phoneNumber: '',
        disabled: false,
        lastLogin: null,
        isPremium: false,
        premiumStartDate: null,
        premiumEndDate: null,
      );
}
