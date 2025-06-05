// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $petsRoute,
    ];

RouteBase get $petsRoute => GoRouteData.$route(
      path: '/pets',
      factory: $PetsRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'create-or-import',
          factory: $CreateOrImportPetRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: ':petId/register',
          factory: $PetRegisterRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: ':petId',
          factory: $PetDetailsRouteExtension._fromState,
        ),
      ],
    );

extension $PetsRouteExtension on PetsRoute {
  static PetsRoute _fromState(GoRouterState state) => const PetsRoute();

  String get location => GoRouteData.$location(
        '/pets',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CreateOrImportPetRouteExtension on CreateOrImportPetRoute {
  static CreateOrImportPetRoute _fromState(GoRouterState state) =>
      const CreateOrImportPetRoute();

  String get location => GoRouteData.$location(
        '/pets/create-or-import',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PetRegisterRouteExtension on PetRegisterRoute {
  static PetRegisterRoute _fromState(GoRouterState state) => PetRegisterRoute(
        petId: state.pathParameters['petId']!,
        $extra: state.extra as List<AppFileViewModel>?,
      );

  String get location => GoRouteData.$location(
        '/pets/${Uri.encodeComponent(petId)}/register',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $PetDetailsRouteExtension on PetDetailsRoute {
  static PetDetailsRoute _fromState(GoRouterState state) => PetDetailsRoute(
        petId: state.pathParameters['petId']!,
        $extra: state.extra as List<AppFileViewModel>?,
      );

  String get location => GoRouteData.$location(
        '/pets/${Uri.encodeComponent(petId)}',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}
