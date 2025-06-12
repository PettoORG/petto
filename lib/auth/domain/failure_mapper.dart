import 'package:petto/core/domain/failure.dart' as f;
import 'package:petto/auth/domain/auth_failure.dart';

/// Converts a general [Failure] into an auth-specific [AuthFailure].
extension FailureToAuthFailureX on f.Failure {
  AuthFailure toAuthFailure() => switch (this) {
        // ── Network stays Network ────────────────────────────────────────────
        f.Network(message: final m, code: final c, cause: final o, stackTrace: final s) =>
          AuthFailure.network(message: m, code: c, cause: o, stackTrace: s),

        // ── Any other Failure is “unexpected” for the auth layer ─────────────
        f.Firestore(message: final m, code: final c, cause: final o, stackTrace: final s) ||
        f.Storage(message: final m, code: final c, cause: final o, stackTrace: final s) ||
        f.Validation(message: final m, code: final c, cause: final o, stackTrace: final s) ||
        f.Unexpected(message: final m, code: final c, cause: final o, stackTrace: final s) =>
          AuthFailure.unexpected(message: m, code: c, cause: o, stackTrace: s),
      };
}
