import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petto/users/domain/user.dart';

part 'user_vm.freezed.dart';

/// ViewModel for the User entity.
/// This class is used to manage and manipulate USer data in the UI layer.
@freezed
sealed class UserVM with _$UserVM {
  const UserVM._();

  /// Factory constructor for creating a UserVM instance.
  const factory UserVM({
    required String id,
    required String displayName,
    required String email,
  }) = _UserVM;

  /// Creates a UserVM from a User entity.
  factory UserVM.fromEntity(User entity) => UserVM(
        id: entity.id,
        displayName: entity.displayName,
        email: entity.email,
      );

  /// Creates an empty UserVM instance with default values.
  factory UserVM.empty() => UserVM(
        id: '0',
        displayName: '',
        email: '',
      );

  /// Converts the UserVM back to a User entity.
  /// Constructs a new User object based on the VM fields.
  User toEntity(User entity) => entity.copyWith(
        id: id,
        displayName: displayName,
        email: email,
      );
}
