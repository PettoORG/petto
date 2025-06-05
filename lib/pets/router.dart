import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Screens for the pets feature (replace with real imports).
import 'package:petto/pets/presentation/screens/create_or_import_pet_screen.dart';
import 'package:petto/pets/presentation/screens/pet_register_screen.dart';
import 'package:petto/pets/presentation/screens/pet_details_screen.dart';
import 'package:petto/core/files/application/app_file_view_model.dart';

part 'router.g.dart';

/// Parent route for the pets feature.
@TypedGoRoute<PetsRoute>(
  path: '/pets',
  routes: <TypedGoRoute<GoRouteData>>[
    // Step 1: choose how to add the pet
    TypedGoRoute<CreateOrImportPetRoute>(path: 'create-or-import'),
    // Step 2: register data for a specific pet (petId is preserved)
    TypedGoRoute<PetRegisterRoute>(path: ':petId/register'),
    // Detail view for any given pet
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

/// Route for the pet registration flow – keeps `petId` as path parameter to
/// maintain context throughout the flow (mirrors the Reminder example).
class PetRegisterRoute extends GoRouteData {
  const PetRegisterRoute({
    required this.petId,
    List<AppFileViewModel>? $extra,
  }) : $extra = $extra ?? const [];

  /// Path parameter.
  final String petId;

  /// Optional files sent via `extra` (e.g. pet images, PDFs).
  final List<AppFileViewModel> $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) => PetRegisterScreen(id: petId, files: $extra);
}

/// Detail screen – shows one pet by id and optionally attached files.
class PetDetailsRoute extends GoRouteData {
  const PetDetailsRoute({
    required this.petId,
    List<AppFileViewModel>? $extra,
  }) : $extra = $extra ?? const [];

  /// Path parameter.
  final String petId;

  /// Files sent via `extra`.
  final List<AppFileViewModel> $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) => PetDetailsScreen(id: petId, files: $extra);
}
