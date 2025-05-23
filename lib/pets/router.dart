import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petto/pets/presentation/screens/create_or_import_pet_screen.dart';
import 'package:petto/pets/presentation/screens/pet_register_screen.dart';

part 'router.g.dart';

@TypedGoRoute<CreateOrImportPetRoute>(
  path: '/createorimportpet',
)
class CreateOrImportPetRoute extends GoRouteData {
  const CreateOrImportPetRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CreateOrImportPetScreen();
  }
}

@TypedGoRoute<PetRegisterRoute>(
  path: '/petregister',
)
class PetRegisterRoute extends GoRouteData {
  const PetRegisterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PetRegisterScreen();
  }
}
