import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'id_provider.g.dart';

/// Provides a string that indicates the id of the document (or record) selected.
/// Given that it is a FamilyProvider, the [family] allows to re-use the provider,
/// indicating the "instance" that will be used from the Provider. Usually, it is
/// a constant named 'moduleName' to identify the instance of the module.
@riverpod
class Id extends _$Id {
  @override
  String? build(String family) => null;

  set id(String? id) {
    if (state != id) state = id;
  }
}
