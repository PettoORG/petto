import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petto/auth/presentation/screens/sign_in_screen.dart';
import 'package:petto/auth/presentation/screens/sign_up_screen.dart'; // 1️⃣ importa SignUpScreen

part 'app_router.g.dart';

/// App router configuration using generated routes
final GoRouter appRouter = GoRouter(
  initialLocation: '/signin',
  debugLogDiagnostics: true,
  routes: $appRoutes,
);

@TypedGoRoute<SignInRoute>(
  path: '/signin',
)
class SignInRoute extends GoRouteData {
  const SignInRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SignInScreen();
}

@TypedGoRoute<SignUpRoute>(
  path: '/signup',
)
class SignUpRoute extends GoRouteData {
  const SignUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SignUpScreen();
}
