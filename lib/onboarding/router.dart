import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petto/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:petto/onboarding/presentation/screens/pet_onboarding.dart';

part 'router.g.dart';

@TypedGoRoute<OnboardingRoute>(
  path: '/onboarding',
)
class OnboardingRoute extends GoRouteData {
  const OnboardingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OnboardingScreen();
  }
}

@TypedGoRoute<PetOnboardingRoute>(
  path: '/pet-onboarding',
)
class PetOnboardingRoute extends GoRouteData {
  const PetOnboardingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PetOnboardingScreen();
  }
}
