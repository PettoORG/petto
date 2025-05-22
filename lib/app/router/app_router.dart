// lib/app/router/app_router.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petto/auth/presentation/screens/email_verification_screen.dart';
import 'package:petto/auth/presentation/screens/forgot_password_screen.dart';
import 'package:petto/auth/presentation/screens/sign_in_screen.dart';
import 'package:petto/auth/presentation/screens/sign_up_screen.dart';
import 'package:petto/home/presentation/screens/home_screen.dart';
import 'package:petto/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:petto/pets/presentation/screens/create_or_import_pet_screen.dart';
import 'package:petto/pets/presentation/screens/pet_register_screen.dart';

part 'app_router.g.dart';

class AppRouter {
  /// Key for the root Navigator
  final GlobalKey<NavigatorState> navigatorKey;

  /// Internal GoRouter instance
  late final GoRouter _router;

  AppRouter({GlobalKey<NavigatorState>? navigatorKey}) : navigatorKey = navigatorKey ?? GlobalKey<NavigatorState>() {
    _router = GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      navigatorKey: this.navigatorKey,
      routes: $appRoutes,
    );
  }

  /// Exposes the configured GoRouter
  GoRouter get router => _router;
}

/// Typed (and generated) route definitions below

@TypedGoRoute<ForgotPasswordRoute>(
  path: '/forgotPassword',
)
class ForgotPasswordRoute extends GoRouteData {
  const ForgotPasswordRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const ForgotPasswordScreen();
}

@TypedGoRoute<EmailVerificationRoute>(
  path: '/emailVerification',
)
class EmailVerificationRoute extends GoRouteData {
  const EmailVerificationRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const EmailVerificationScreen();
}

@TypedGoRoute<CreateOrImportPetRoute>(
  path: '/createorimportpet',
)
class CreateOrImportPetRoute extends GoRouteData {
  const CreateOrImportPetRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const CreateOrImportPetScreen();
}

@TypedGoRoute<PetRegisterRoute>(
  path: '/petregister',
)
class PetRegisterRoute extends GoRouteData {
  const PetRegisterRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const PetRegisterScreen();
}

@TypedGoRoute<HomeRoute>(
  path: '/',
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
