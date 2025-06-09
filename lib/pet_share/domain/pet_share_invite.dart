import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petto/core/domain/base_entity.dart';
import 'package:petto/pet_share/domain/pet_share_role.dart';

part 'pet_share_invite.freezed.dart';

/// One-time code that allows a guest to obtain a PetShare.
/// Lives in the `petShareInvites` collection, separate from pets and shares.
/// Automatically removed after `expiresAt` via Firestore TTL.
@freezed
sealed class PetShareInvite with _$PetShareInvite implements BaseEntity {
  const PetShareInvite._();

  const factory PetShareInvite({
    /// Invitation code used as the document ID.
    required String id,

    /// Identifier of the pet that will be shared.
    required String petId,

    /// Role that will be granted upon successful redemption.
    required PetShareRole defaultRole,

    /// UID of the user who generated the invite. Typically matches the pet owner or co-owner.
    required String invitedBy,

    /// Date-time (UTC) when the code becomes unusable. Also leveraged by Firestore TTL for auto-cleanup.
    required DateTime expiresAt,

    /// UID of the user who already redeemed the invite.
    /// Null until the first (and only) successful use.
    /// Guarantees single-use semantics.
    String? redeemedBy,

    /// Timestamp marking when the code was redeemed.
    /// Null until redemption happens.
    /// Useful for analytics or troubleshooting.
    DateTime? redeemedAt,
  }) = _PetShareInvite;

  /// Factory helper for empty placeholders or tests.
  factory PetShareInvite.empty() => PetShareInvite(
        id: '',
        petId: '',
        defaultRole: PetShareRole.viewer,
        invitedBy: '',
        expiresAt: DateTime.now(),
        redeemedBy: null,
        redeemedAt: null,
      );
}
