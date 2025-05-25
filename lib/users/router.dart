import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petto/users/presentation/screens/user_details_screen.dart';

part 'router.g.dart';

/// Defines the route for the Home feature.
@TypedGoRoute<UserDetailsRoute>(
  path: '/userDetails',
)
class UserDetailsRoute extends GoRouteData {
  const UserDetailsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UserDetailsScreen();
  }
}
