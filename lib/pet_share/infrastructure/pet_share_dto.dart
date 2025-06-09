import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petto/core/infrastructure/base_dto.dart';
import 'package:petto/core/domain/json_converter/timestamp_converter.dart';
import 'package:petto/pet_share/domain/pet_share.dart';
import 'package:petto/pet_share/domain/pet_share_role.dart';
import 'package:petto/users/domain/user.dart';

part 'pet_share_dto.freezed.dart';
part 'pet_share_dto.g.dart';

@freezed
sealed class PetShareDTO with _$PetShareDTO implements BaseDTO<PetShare> {
  const PetShareDTO._();

  const factory PetShareDTO({
    @Default('0') String id,
    required String petId,
    required String userId,
    required PetShareRole role,
    @TimestampConverter() DateTime? expiresAt,
    @TimestampConverter() required DateTime createdAt,
    required String invitedBy,
  }) = _PetShareDTO;

  @Implements<FromDocumentSnapshotFactory>()
  factory PetShareDTO.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return PetShareDTO.fromJson(data).copyWith(id: doc.id);
  }

  @Implements<FromDomainFactory>()
  factory PetShareDTO.fromDomain(PetShare share) {
    return PetShareDTO(
      id: share.id,
      petId: share.petId,
      userId: share.userId,
      role: share.role,
      expiresAt: share.expiresAt,
      createdAt: share.createdAt,
      invitedBy: share.invitedBy,
    );
  }

  @Implements<FromJsonFactory>()
  factory PetShareDTO.fromJson(Map<String, dynamic> json) => _$PetShareDTOFromJson(json);

  @override
  Map<String, dynamic> toDocument() => toJson()..remove('id');

  @override
  Map<String, dynamic> toCreateDocument(User user) {
    final now = DateTime.now();
    return copyWith(
      createdAt: now,
      invitedBy: user.uid,
    ).toDocument();
  }

  @override
  Map<String, dynamic> toUpdateDocument(User user) => toDocument();

  @override
  PetShare toDomain() {
    return PetShare(
      id: id,
      petId: petId,
      userId: userId,
      role: role,
      expiresAt: expiresAt,
      createdAt: createdAt,
      invitedBy: invitedBy,
    );
  }
}
