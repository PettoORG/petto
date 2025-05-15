import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petto/auth/presentation/screens/sign_in_screen.dart';
import 'package:petto/auth/presentation/screens/sign_up_screen.dart';
import 'package:petto/home/presentation/home_screen.dart';
import 'package:petto/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:petto/pets/presentation/screens/pet_register_screen.dart'; // 1️⃣ importa SignUpScreen

part 'app_router.g.dart';

/// App router configuration using generated routes
final GoRouter appRouter = GoRouter(
  initialLocation: '/onboarding',
  debugLogDiagnostics: true,
  routes: $appRoutes,
);

@TypedGoRoute<PetRegisterRoute>(
  path: '/petregister',
)
class PetRegisterRoute extends GoRouteData {
  const PetRegisterRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const PetRegisterScreen();
}

@TypedGoRoute<HomeRoute>(
  path: '/home',
)
class HomeRoute extends GoRouteData {
  const HomeRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

@TypedGoRoute<OnboardingRoute>(
  path: '/onboarding',
)
class OnboardingRoute extends GoRouteData {
  const OnboardingRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const OnboardingScreen();
}

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
