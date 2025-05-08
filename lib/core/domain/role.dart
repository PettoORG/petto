/// Defines the different roles a user can have within the App.
enum UserRole {
  /// Default role for regular users who own pets.
  petOwner,

  /// Administrative user with access to system-level operations.
  admin,

  /// Guest user with limited access, often used before registration.
  guest,
}
