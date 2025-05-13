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
          borderSide: BorderSide(
            color: AppThemeColor.tertiary,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(AppThemeRadius.large),
          borderSide: BorderSide(
            color: AppThemeColor.tertiary,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(AppThemeRadius.large),
          borderSide: BorderSide(
            color: AppThemeColor.tertiary,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(AppThemeRadius.large),
          borderSide: BorderSide(
            color: AppThemeColor.tertiaryContainer,
            width: 2,
          ),
        ),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(fontFamily: 'Comfortaa'),
        titleMedium: TextStyle(fontFamily: 'Comfortaa'),
        titleSmall: TextStyle(fontFamily: 'Comfortaa'),
      ));

  static ThemeData dark() => ThemeData(
        fontFamily: 'Montserrat',
        useMaterial3: true,
      );
}
