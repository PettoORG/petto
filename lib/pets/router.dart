import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Screens for the pets feature (replace with real imports).
import 'package:petto/pets/presentation/screens/create_or_import_pet_screen.dart';
import 'package:petto/pets/presentation/screens/pet_details_screen.dart';
import 'package:petto/core/files/application/app_file_view_model.dart';

part 'router.g.dart';

/// Parent route for the pets feature.
@TypedGoRoute<PetsRoute>(
  path: '/pets',
  routes: <TypedGoRoute<GoRouteData>>[
    // Step 1: choose how to add the pet
    TypedGoRoute<CreateOrImportPetRoute>(path: 'create-or-import'),
    // Detail or registration view for a specific pet
    
    TypedGoRoute<PetDetailsRoute>(path: ':petId'),
  ],
)
class PetsRoute extends GoRouteData {
  const PetsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const CreateOrImportPetScreen();
}

/// Route to create or import a pet (first step).
class CreateOrImportPetRoute extends GoRouteData {
  const CreateOrImportPetRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const CreateOrImportPetScreen();
}

/// Detail screen – shows one pet by id and optionally attached files.
class PetDetailsRoute extends GoRouteData {
  const PetDetailsRoute({
    required this.petId,
    this.basic = false,
    List<AppFileViewModel>? $extra,
  }) : $extra = $extra ?? const [];

  /// Path parameter.
  final String petId;

  /// Files sent via `extra`.
  final List<AppFileViewModel> $extra;
  /// When `true` shows the basic registration form.
  final bool basic;

  @override
  Widget build(BuildContext context, GoRouterState state) => PetDetailsScreen(id: petId, files: $extra, basic: basic);
}
