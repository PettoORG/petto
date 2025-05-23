import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petto/home/presentation/screens/home_screen.dart';

part 'router.g.dart';

/// Defines the route for the Home feature.
@TypedGoRoute<HomeRoute>(
  path: '/',
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}
