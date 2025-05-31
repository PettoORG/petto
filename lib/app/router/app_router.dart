// lib/app/router/app_router.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Import feature routers
import 'package:petto/auth/router.dart' as auth_router;
import 'package:petto/onboarding/router.dart' as onboarding_router;
import 'package:petto/home/router.dart' as home_router;
import 'package:petto/pets/router.dart' as pets_router;
import 'package:petto/users/router.dart' as users_router;
import 'package:petto/reminders/router.dart' as reminders_router;

/// Application-level router that aggregates all feature routes.
class AppRouter {
  /// Key for the root navigator, used for navigation outside of BuildContext.
  final GlobalKey<NavigatorState> navigatorKey;

  late final GoRouter _router;

  AppRouter({GlobalKey<NavigatorState>? navigatorKey}) : navigatorKey = navigatorKey ?? GlobalKey<NavigatorState>() {
    _router = GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      navigatorKey: this.navigatorKey,
      routes: [
        ...auth_router.$appRoutes,
        ...onboarding_router.$appRoutes,
        ...home_router.$appRoutes,
        ...pets_router.$appRoutes,
        ...users_router.$appRoutes,
        ...reminders_router.$appRoutes,
      ],
    );
  }

  /// Expose the configured GoRouter instance.
  GoRouter get router => _router;
}
