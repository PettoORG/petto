import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petto/core/domain/base_entity.dart';
import 'package:petto/pet_share/domain/pet_share_role.dart';

part 'pet_share.freezed.dart';

/// Data model representing the persistent relationship
/// between a pet and a user who has been granted access.
/// Created after a PetShareInvite is successfully redeemed.
@freezed
sealed class PetShare with _$PetShare implements BaseEntity {
  const PetShare._();

  const factory PetShare({
    /// Unique identifier of the share.
    required String id,

    /// Identifier of the pet being shared.
    required String petId,

    /// UID of the user receiving access.
    required String userId,

    /// Role granted to the user. Defines allowed actions (viewer, caretaker, coOwner).
    required PetShareRole role,

    /// Optional timestamp (UTC) when this share expires. After the date, access should be revoked.
    DateTime? expiresAt,

    /// Timestamp (UTC) when the share was created.
    required DateTime createdAt,

    /// UID of the user who created this share. Normally the pet owner or a co-owner.
    required String invitedBy,
  }) = _PetShare;

  /// Factory helper for empty placeholders or tests.
  factory PetShare.empty() => PetShare(
        id: '',
        petId: '',
        userId: '',
        role: PetShareRole.viewer,
        expiresAt: null,
        createdAt: DateTime.now(),
        invitedBy: '',
      );
}
