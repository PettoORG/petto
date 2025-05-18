import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petto/app/theme/app_theme_color.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';

class AppTheme {
  static ThemeData light() {
    final scheme = ColorScheme.fromSeed(
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
      onSurface: AppThemeColor.onSurface,
      onSurfaceVariant: AppThemeColor.onSurfaceVariant,
    );

    return ThemeData(
      fontFamily: 'Montserrat',
      useMaterial3: true,
      scaffoldBackgroundColor: AppThemeColor.background,
      colorScheme: scheme,
      appBarTheme: AppBarTheme(backgroundColor: AppThemeColor.background),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: scheme.onPrimary,
          ),
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
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
      textTheme: Typography.englishLike2018
          .apply(
            fontSizeFactor: 1.sp,
            displayColor: scheme.onSurface,
            bodyColor: scheme.onSurface,
          )
          .copyWith(
            // Display
            displayLarge: TextStyle(fontSize: 57.sp, fontWeight: FontWeight.w400),
            displayMedium: TextStyle(fontSize: 45.sp, fontWeight: FontWeight.w400),
            displaySmall: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w400),

            // Headline
            headlineLarge: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w400),
            headlineMedium: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w400),
            headlineSmall: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400),

            // Title
            titleLarge: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w400),
            titleMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            titleSmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),

            // Body
            bodyLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
            bodyMedium: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
            bodySmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),

            // Label
            labelLarge: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            labelMedium: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
            labelSmall: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500),
          ),
    );
  }

  static ThemeData dark() => ThemeData(
        fontFamily: 'Montserrat',
        useMaterial3: true,
      );
}
