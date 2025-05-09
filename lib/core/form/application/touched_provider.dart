import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'touched_provider.g.dart';

/// Provides a boolean that indicates if a widget has been touched or not by the user.
/// Given that it is a FamilyProvider, the [family] allows to re-use the provider,
/// indicating the "instance" that will be used from the Provider. Usually, it is
/// a constant named 'moduleName' to identify the instance of the module.
@riverpod
class Touched extends _$Touched {
  @override
  bool build(String family) => false;

  void touched() {
    if (state == false) state = true;
  }

  void untouched() {
    if (state == true) state = false;
  }
}
