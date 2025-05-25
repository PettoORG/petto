import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'files_storage_path_provider.g.dart';

/// Provider for Firebase Storage Path to read files.
/// Use [family] to re-use the provider.
@riverpod
class FilesStoragePath extends _$FilesStoragePath {
  @override
  String? build(String? family) => null;

  /// Sets the path for Firebase Storage provider.
  void set(String? path) {
    if (state != path) {
      state = path;
    }
  }
}
