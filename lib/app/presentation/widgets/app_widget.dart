import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/router/app_router.dart';
import 'package:petto/app/theme/app_theme.dart';
import 'package:petto/app/theme/app_theme_notifier.dart';
import 'package:petto/auth/application/auth_notifier.dart';
import 'package:petto/auth/application/auth_state.dart';
import 'package:petto/auth/router.dart';
import 'package:petto/core/shared/providers.dart';
import 'package:petto/home/router.dart';
import 'package:petto/onboarding/router.dart';
import 'package:petto/preferences/shared/providers.dart';
import 'package:petto/users/domain/user.dart';

class AppWidget extends StatefulHookConsumerWidget {
  const AppWidget({super.key});

  static final AppRouter appRouter = AppRouter(navigatorKey: GlobalKey<NavigatorState>());

  @override
  ConsumerState<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends ConsumerState<AppWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeNotifierProvider).value;
    // Listen to internet connection (useful for UI updates).
    ref.watch(internetConnectionProvider);

    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final router = AppWidget.appRouter.router;

        final currentLocation = router.routeInformationProvider.value.uri.toString();

        final seen = ref.read(appPreferencesRepositoryProvider).getHasSeenOnboarding().getOrElse(() => false);

        // Redirect to onboarding if the user hasn't seen it yet.
        if (!seen && currentLocation != OnboardingRoute().location) {
          router.go(OnboardingRoute().location);
          return;
        }

        if (next is Authenticated) {
          User user = next.user;

          if (!user.emailVerified) {
            router.go(EmailVerificationRoute().location);
            return;
          }

          final homeAllowedRoutes = [
            SignInRoute().location,
            SignUpRoute().location,
            OnboardingRoute().location,
            EmailVerificationRoute().location
          ];

          if (homeAllowedRoutes.contains(currentLocation)) {
            router.go(HomeRoute().location);
            return;
          }
        } else if (next is Unauthenticated) {
          // Allowed routes without authentication.
          final unauthenticated = [
            SignInRoute().location,
            SignUpRoute().location,
            OnboardingRoute().location,
          ];

          if (!unauthenticated.contains(currentLocation)) {
            router.go(SignInRoute().location);
          }
        }
      });
    });

    return MaterialApp.router(
      routerConfig: AppWidget.appRouter.router,
      debugShowCheckedModeBanner: false,
      title: 'Petto',
      theme: theme ?? AppTheme.light(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
