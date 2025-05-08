import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petto/core/domain/json_converter/timestamp_converter.dart';
import 'package:petto/users/domain/role.dart';
import 'package:petto/core/infrastructure/base_dto.dart';
import 'package:petto/users/domain/user.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
sealed class UserDTO with _$UserDTO implements BaseDTO<User> {
  const UserDTO._();

  const factory UserDTO({
    @Default('0') String id,
    required String uid,
    required UserRole role,
    required String email,
    required bool emailVerified,
    required String? photoUrl,
    required String displayName,
    required bool disabled,
    @TimestampConverter() required DateTime? createdAt,
    @TimestampConverter() required DateTime? modifiedAt,
    required String createdBy,
    required String modifiedBy,
    required bool isPremium,
    @TimestampConverter() required DateTime? premiumStartDate,
    @TimestampConverter() required DateTime? premiumEndDate,
  }) = _UserDTO;

  @Implements<FromDocumentSnapshotFactory>()
  factory UserDTO.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return UserDTO.fromJson(data).copyWith(id: doc.id);
  }

  @Implements<FromDomainFactory>()
  factory UserDTO.fromDomain(User user) {
    return UserDTO(
      id: user.uid,
      uid: user.uid,
      role: user.role,
      email: user.email,
      emailVerified: user.emailVerified,
      photoUrl: user.photoUrl,
      displayName: user.displayName,
      disabled: user.disabled,
      createdAt: user.createdAt,
      modifiedAt: user.modifiedAt,
      createdBy: user.createdBy,
      modifiedBy: user.modifiedBy,
      isPremium: user.isPremium,
      premiumStartDate: user.premiumStartDate,
      premiumEndDate: user.premiumEndDate,
    );
  }

  @Implements<FromJsonFactory>()
  factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

  @override
  Map<String, dynamic> toDocument() => toJson()..remove('id');

  @override
  Map<String, dynamic> toCreateDocument(User user) {
    final now = DateTime.now();
    return copyWith(
      createdAt: now,
      createdBy: user.uid,
      modifiedAt: now,
      modifiedBy: user.uid,
    ).toDocument();
  }

  @override
  Map<String, dynamic> toUpdateDocument(User user) {
    return copyWith(
      modifiedAt: DateTime.now(),
      modifiedBy: user.uid,
    ).toDocument();
  }

  @override
  User toDomain() {
    return User(
      id: uid,
      uid: uid,
      role: role,
      email: email,
      emailVerified: emailVerified,
      photoUrl: photoUrl,
      displayName: displayName,
      disabled: disabled,
      createdAt: createdAt,
      modifiedAt: modifiedAt,
      createdBy: createdBy,
      modifiedBy: modifiedBy,
      isPremium: isPremium,
      premiumStartDate: premiumStartDate,
      premiumEndDate: premiumEndDate,
    );
  }
}
