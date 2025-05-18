import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/router/app_router.dart';
import 'package:petto/app/theme/app_theme.dart';
import 'package:petto/app/theme/app_theme_notifier.dart';
import 'package:petto/core/shared/providers.dart';

class AppWidget extends StatefulHookConsumerWidget {
  const AppWidget({super.key});

  @override
  ConsumerState<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends ConsumerState<AppWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeNotifierProvider).value;
    ref.watch(internetConnectionProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Petto',
      theme: theme ?? AppTheme.light(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
