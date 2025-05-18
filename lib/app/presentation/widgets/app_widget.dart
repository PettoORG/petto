import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // ← Esto es fundamental
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/router/app_router.dart';
import 'package:petto/app/theme/app_theme.dart';
import 'package:petto/app/theme/app_theme_notifier.dart';
import 'package:petto/auth/application/auth_notifier.dart';
import 'package:petto/auth/application/auth_state.dart';
import 'package:petto/core/shared/providers.dart';
import 'package:petto/preferences/shared/providers.dart';
import 'package:petto/users/domain/user.dart';

class AppWidget extends StatefulHookConsumerWidget {
  const AppWidget({super.key});

  static AppRouter appRouter = AppRouter(navigatorKey: GlobalKey<NavigatorState>());

  @override
  ConsumerState<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends ConsumerState<AppWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeNotifierProvider).value;
    ref.watch(internetConnectionProvider);

    ref.listen<AuthState>(authNotifierProvider, (prev, next) {
      // Navigate to onboarding only if the flag is explicitly false (ignore failures)
      final seen = ref.read(appPreferencesRepositoryProvider).getHasSeenOnboarding().getOrElse(() => false);
      if (!seen) {
        AppWidget.appRouter.router.go(OnboardingRoute().location);
        return;
      }

      // Existing auth navigation logic
      if (next is Authenticated) {
        final User user = next.user;
        final String location = GoRouter.of(context).state.matchedLocation;

        if (!user.emailVerified) {
          AppWidget.appRouter.router.go(HomeRoute().location);
        }
      } else if (next is Unauthenticated) {
        AppWidget.appRouter.router.go(SignInRoute().location);
      }
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
