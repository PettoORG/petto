import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petto/core/domain/json_converter/timestamp_converter.dart';
import 'package:petto/core/infrastructure/base_dto.dart';
import 'package:petto/pet_share/domain/pet_share_invite.dart';
import 'package:petto/pet_share/domain/pet_share_role.dart';
import 'package:petto/users/domain/user.dart';

part 'pet_share_invite_dto.freezed.dart';
part 'pet_share_invite_dto.g.dart';

@freezed
sealed class PetShareInviteDTO
    with _$PetShareInviteDTO
    implements BaseDTO<PetShareInvite> {
  const PetShareInviteDTO._();

  const factory PetShareInviteDTO({
    @Default('') String id,
    required String petId,
    required PetShareRole defaultRole,
    required String invitedBy,
    @TimestampConverter() required DateTime expiresAt,
    String? redeemedBy,
    @TimestampConverter() DateTime? redeemedAt,
  }) = _PetShareInviteDTO;

  @Implements<FromDocumentSnapshotFactory>()
  factory PetShareInviteDTO.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return PetShareInviteDTO.fromJson(data).copyWith(id: doc.id);
  }

  @Implements<FromDomainFactory>()
  factory PetShareInviteDTO.fromDomain(PetShareInvite invite) {
    return PetShareInviteDTO(
      id: invite.id,
      petId: invite.petId,
      defaultRole: invite.defaultRole,
      invitedBy: invite.invitedBy,
      expiresAt: invite.expiresAt,
      redeemedBy: invite.redeemedBy,
      redeemedAt: invite.redeemedAt,
    );
  }

  @Implements<FromJsonFactory>()
  factory PetShareInviteDTO.fromJson(Map<String, dynamic> json) =>
      _$PetShareInviteDTOFromJson(json);

  @override
  Map<String, dynamic> toDocument() => toJson()..remove('id');

  @override
  Map<String, dynamic> toCreateDocument(User user) => toDocument();

  @override
  Map<String, dynamic> toUpdateDocument(User user) => toDocument();

  @override
  PetShareInvite toDomain() {
    return PetShareInvite(
      id: id,
      petId: petId,
      defaultRole: defaultRole,
      invitedBy: invitedBy,
      expiresAt: expiresAt,
      redeemedBy: redeemedBy,
      redeemedAt: redeemedAt,
    );
  }
}
