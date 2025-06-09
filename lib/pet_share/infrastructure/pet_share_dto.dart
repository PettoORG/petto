import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petto/core/domain/json_converter/timestamp_converter.dart';
import 'package:petto/core/infrastructure/base_dto.dart';
import 'package:petto/pet_share/domain/pet_share.dart';
import 'package:petto/pet_share/domain/pet_share_role.dart';
import 'package:petto/users/domain/user.dart';

class PetShareDTO implements BaseDTO<PetShare> {
  PetShareDTO({
    required this.id,
    required this.petId,
    required this.userId,
    required this.role,
    required this.expiresAt,
    required this.createdAt,
    required this.invitedBy,
  });

  factory PetShareDTO.fromJson(Map<String, dynamic> json, String id) {
    return PetShareDTO(
      id: id,
      petId: json['petId'] as String,
      userId: json['userId'] as String,
      role: PetShareRole.values.firstWhere((e) => e.name == json['role']),
      expiresAt: json['expiresAt'] != null
          ? const TimestampConverter().fromJson(json['expiresAt'] as Timestamp)
          : null,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      invitedBy: json['invitedBy'] as String,
    );
  }

  factory PetShareDTO.fromDocumentSnapshot(DocumentSnapshot doc) {
    return PetShareDTO.fromJson(doc.data()! as Map<String, dynamic>, doc.id);
  }

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

  final String id;
  final String petId;
  final String userId;
  final PetShareRole role;
  final DateTime? expiresAt;
  final DateTime createdAt;
  final String invitedBy;

  @override
  Map<String, dynamic> toDocument() {
    return {
      'petId': petId,
      'userId': userId,
      'role': role.name,
      'expiresAt': expiresAt != null
          ? const TimestampConverter().toJson(expiresAt!)
          : null,
      'createdAt': const TimestampConverter().toJson(createdAt),
      'invitedBy': invitedBy,
    }..removeWhere((key, value) => value == null);
  }

  @override
  Map<String, dynamic> toCreateDocument(User user) => toDocument();

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
