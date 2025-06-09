import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petto/core/domain/json_converter/timestamp_converter.dart';
import 'package:petto/core/infrastructure/base_dto.dart';
import 'package:petto/pet_share/domain/pet_share_invite.dart';
import 'package:petto/pet_share/domain/pet_share_role.dart';
import 'package:petto/users/domain/user.dart';

class PetShareInviteDTO implements BaseDTO<PetShareInvite> {
  PetShareInviteDTO({
    required this.id,
    required this.petId,
    required this.defaultRole,
    required this.invitedBy,
    required this.expiresAt,
    this.redeemedBy,
    this.redeemedAt,
  });

  factory PetShareInviteDTO.fromJson(Map<String, dynamic> json, String id) {
    return PetShareInviteDTO(
      id: id,
      petId: json['petId'] as String,
      defaultRole:
          PetShareRole.values.firstWhere((e) => e.name == json['defaultRole']),
      invitedBy: json['invitedBy'] as String,
      expiresAt:
          const TimestampConverter().fromJson(json['expiresAt'] as Timestamp),
      redeemedBy: json['redeemedBy'] as String?,
      redeemedAt: json['redeemedAt'] != null
          ? const TimestampConverter().fromJson(json['redeemedAt'] as Timestamp)
          : null,
    );
  }

  factory PetShareInviteDTO.fromDocumentSnapshot(DocumentSnapshot doc) {
    return PetShareInviteDTO.fromJson(doc.data()! as Map<String, dynamic>, doc.id);
  }

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

  final String id;
  final String petId;
  final PetShareRole defaultRole;
  final String invitedBy;
  final DateTime expiresAt;
  final String? redeemedBy;
  final DateTime? redeemedAt;

  @override
  Map<String, dynamic> toDocument() {
    return {
      'petId': petId,
      'defaultRole': defaultRole.name,
      'invitedBy': invitedBy,
      'expiresAt': const TimestampConverter().toJson(expiresAt),
      'redeemedBy': redeemedBy,
      'redeemedAt': redeemedAt != null
          ? const TimestampConverter().toJson(redeemedAt!)
          : null,
    }..removeWhere((key, value) => value == null);
  }

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
