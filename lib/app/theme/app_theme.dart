import 'package:flutter/material.dart';
import 'package:petto/app/theme/app_theme_color.dart';

class AppTheme {
  static ThemeData light() => ThemeData(
        fontFamily: 'Montserrat',
        useMaterial3: true,
        scaffoldBackgroundColor: AppThemeColor.surface,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppThemeColor.primary,
          primary: AppThemeColor.primary,
          onPrimary: AppThemeColor.onPrimary,
          primaryContainer: AppThemeColor.primaryContainer,
          onPrimaryContainer: AppThemeColor.onPrimaryContainer,
          secondary: AppThemeColor.secondary,
          onSecondary: AppThemeColor.onSecondary,
          secondaryContainer: AppThemeColor.secondaryContainer,
          onSecondaryContainer: AppThemeColor.onSecondaryContainer,
          tertiary: AppThemeColor.tertiary,
          onTertiary: AppThemeColor.onTertiary,
          tertiaryContainer: AppThemeColor.tertiaryContainer,
          onTertiaryContainer: AppThemeColor.onTertiaryContainer,
          surface: AppThemeColor.surface,
          surfaceBright: AppThemeColor.surfaceBright,
          surfaceContainerLowest: AppThemeColor.surfaceContainerLowest,
          surfaceContainerLow: AppThemeColor.surfaceContainerLow,
          surfaceContainer: AppThemeColor.surfaceContainer,
          surfaceContainerHigh: AppThemeColor.surfaceContainerHigh,
          surfaceContainerHighest: AppThemeColor.surfaceContainerHighest,
          onSurface: AppThemeColor.onSurface,
          onSurfaceVariant: AppThemeColor.onSurfaceVariant,
        ),
      );

  static ThemeData dark() => ThemeData(
        fontFamily: 'Montserrat',
        useMaterial3: true,
      );
}
