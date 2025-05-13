import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petto/auth/presentation/screens/auth_screen.dart';

part 'app_router.g.dart';

/// App router configuration using generated routes
final GoRouter appRouter = GoRouter(
  initialLocation: '/auth',
  debugLogDiagnostics: true,
  routes: $appRoutes,
);

@TypedGoRoute<AuthRoute>(
  path: '/auth',
)
class AuthRoute extends GoRouteData {
  const AuthRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AuthScreen();
}
