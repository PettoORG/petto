import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petto/core/files/application/app_file_view_model.dart';
import 'package:petto/users/presentation/screens/user_details_screen.dart';

part 'router.g.dart';

/// Defines the route for UserDetailsScreen with an optional extra parameter.
@TypedGoRoute<UserDetailsRoute>(
  path: '/userDetails',
)
class UserDetailsRoute extends GoRouteData {
  /// Optional extra list of files passed to the screen.
  final List<AppFileViewModel>? $extra;

  const UserDetailsRoute({this.$extra});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    // Pass an empty list if no extra files were provided.
    return UserDetailsScreen(files: $extra ?? []);
  }
}
