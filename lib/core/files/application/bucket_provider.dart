import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bucket_provider.g.dart';

/// Provider for Firebase Storage Bucket. Null for default bucket. Use [family]
/// to re-use the provider.
@riverpod
class Bucket extends _$Bucket {
  @override
  String? build(String family) => null;

  void set(String? bucket) {
    if (state != bucket) {
      state = bucket;
    }
  }
}
