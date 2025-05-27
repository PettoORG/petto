// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $userDetailsRoute,
    ];

RouteBase get $userDetailsRoute => GoRouteData.$route(
      path: '/userDetails',
      factory: $UserDetailsRouteExtension._fromState,
    );

extension $UserDetailsRouteExtension on UserDetailsRoute {
  static UserDetailsRoute _fromState(GoRouterState state) => UserDetailsRoute(
        $extra: state.extra as List<AppFileViewModel>?,
      );

  String get location => GoRouteData.$location(
        '/userDetails',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}
