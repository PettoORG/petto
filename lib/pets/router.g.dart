// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $createOrImportPetRoute,
      $petRegisterRoute,
    ];

RouteBase get $createOrImportPetRoute => GoRouteData.$route(
      path: '/createorimportpet',
      factory: $CreateOrImportPetRouteExtension._fromState,
    );

extension $CreateOrImportPetRouteExtension on CreateOrImportPetRoute {
  static CreateOrImportPetRoute _fromState(GoRouterState state) =>
      const CreateOrImportPetRoute();

  String get location => GoRouteData.$location(
        '/createorimportpet',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $petRegisterRoute => GoRouteData.$route(
      path: '/petregister/:id',
      factory: $PetRegisterRouteExtension._fromState,
    );

extension $PetRegisterRouteExtension on PetRegisterRoute {
  static PetRegisterRoute _fromState(GoRouterState state) => PetRegisterRoute(
        id: state.pathParameters['id']!,
        $extra: state.extra as List<AppFileViewModel>?,
      );

  String get location => GoRouteData.$location(
        '/petregister/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}
