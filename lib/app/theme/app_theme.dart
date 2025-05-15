import 'package:flutter/material.dart';
import 'package:petto/app/theme/app_theme_color.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';

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
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppThemeColor.primary,
          foregroundColor: AppThemeColor.onPrimary,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(AppThemeRadius.large),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(AppThemeRadius.large),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(AppThemeRadius.large),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(AppThemeRadius.large),
        ),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(fontFamily: 'Comfortaa', fontWeight: FontWeight.w600),
        titleMedium: TextStyle(fontFamily: 'Comfortaa', fontWeight: FontWeight.w600),
        titleSmall: TextStyle(fontFamily: 'Comfortaa', fontWeight: FontWeight.w600),
      ));

  static ThemeData dark() => ThemeData(
        fontFamily: 'Montserrat',
        useMaterial3: true,
      );
}
