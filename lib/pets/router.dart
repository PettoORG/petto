import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petto/pets/presentation/screens/create_or_import_pet_screen.dart';
import 'package:petto/pets/presentation/screens/pet_register_screen.dart';
import 'package:petto/core/files/application/app_file_view_model.dart';

part 'router.g.dart';

@TypedGoRoute<CreateOrImportPetRoute>(
  path: '/createorimportpet',
)
class CreateOrImportPetRoute extends GoRouteData {
  const CreateOrImportPetRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const CreateOrImportPetScreen();
}

@TypedGoRoute<PetRegisterRoute>(
  path: '/petregister/:id',
)
class PetRegisterRoute extends GoRouteData {
  /// Document identifier for the pet
  final String id;

  /// Files passed via navigation extra
  final List<AppFileViewModel> $extra;

  const PetRegisterRoute({
    required this.id,
    List<AppFileViewModel>? $extra,
  }) : $extra = $extra ?? const [];

  @override
  Widget build(BuildContext context, GoRouterState state) => PetRegisterScreen(
        id: id,
        files: $extra,
      );
}
