import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'files_firestore_path_provider.g.dart';

/// Provider for Firebase Firestore Path to read files.
/// Use [family] to re-use the provider.
@riverpod
class FilesFirestorePath extends _$FilesFirestorePath {
  @override
  String? build(String? family) => null;

  /// Sets the path for Firebase Firestore provider.
  void set(String? path) {
    if (state != path) {
      state = path;
    }
  }
}
