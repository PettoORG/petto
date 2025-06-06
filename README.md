# Petto

Petto is a Flutter application that tracks your pets and their reminders. The project follows a Domain‑Driven Design (DDD) structure and heavily relies on code generation.

## Code Generation

The project uses `build_runner` together with packages such as `go_router_builder`, `freezed` and `riverpod_generator`. Generated files (`.g.dart`, `.freezed.dart`) should not be edited manually.

## Routing

All feature routes are aggregated in `AppRouter`, which exposes a global `GoRouter` instance. Each module contributes its own typed routes to this configuration:

```dart
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

  AppRouter({GlobalKey<NavigatorState>? navigatorKey})
      : navigatorKey = navigatorKey ?? GlobalKey<NavigatorState>() {
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
```

## Theme

`AppTheme` defines the light and dark themes. Colors come from `AppThemeColor` and spacing values from `AppThemeSizes`. Text styles and border radii scale with [Flutter ScreenUtil](https://pub.dev/packages/flutter_screenutil):

```dart
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
```

## Spacing and Sizing

`AppThemeSizes` provides reusable constants for spacing, radii and shadows. These values are responsive thanks to ScreenUtil extensions like `.sw`, `.sh`, `.sp` and `.r`:

```dart
/// Defines horizontal and vertical spacing constants
class AppThemeSpacing {
  /// Horizontal spacing as a percentage of screen width
  static double get extraTinyW => 0.01.sw; // 1% of screen width
  static double get tinyW => 0.015.sw; // 1.5% of screen width
  static double get extraSmallW => 0.02.sw; // 2% of screen width
  static double get smallW => 0.04.sw; // 4% of screen width
  static double get mediumW => 0.06.sw; // 6% of screen width
  static double get largeW => 0.08.sw; // 8% of screen width
  static double get extraLargeW => 0.10.sw; // 10% of screen width
  static double get doubleXLW => 0.12.sw; // 12% of screen width
  static double get tripleXLW => 0.15.sw; // 15% of screen width
  static double get ultraW => 0.20.sw; // 20% of screen width

  /// Vertical spacing as a percentage of screen height
  static double get extraTinyH => 0.01.sh; // 1% of screen height
  static double get tinyH => 0.015.sh; // 1.5% of screen height
  static double get extraSmallH => 0.02.sh; // 2% of screen height
  static double get smallH => 0.04.sh; // 4% of screen height
  static double get mediumH => 0.06.sh; // 6% of screen height
  static double get largeH => 0.08.sh; // 8% of screen height
  static double get extraLargeH => 0.10.sh; // 10% of screen height
  static double get doubleXLH => 0.12.sh; // 12% of screen height
  static double get tripleXLH => 0.15.sh; // 15% of screen height
  static double get ultraH => 0.20.sh; // 20% of screen height
}

/// Defines radii scaled with screen util
class AppThemeRadius {
  static Radius get small => Radius.circular(8.r);
  static Radius get medium => Radius.circular(12.r);
  static Radius get large => Radius.circular(16.r);
  static Radius get extraLarge => Radius.circular(24.r);
  static Radius get doubleXL => Radius.circular(32.r);
  static Radius get tripleXL => Radius.circular(48.r);
}

/// Defines box shadows with scaled blur and offset
class AppThemeShadow {
  static BoxShadow get small => BoxShadow(
        color: Color.fromARGB(10, 0, 0, 0),
        blurRadius: 4.r,
        offset: Offset(0, 2.r),
      );

  static BoxShadow get medium => BoxShadow(
        color: Color.fromARGB(20, 0, 0, 0),
        blurRadius: 8.r,
        offset: Offset(0, 4.r),
      );

  static BoxShadow get large => BoxShadow(
        color: Color.fromARGB(30, 0, 0, 0),
        blurRadius: 12.r,
        offset: Offset(0, 8.r),
      );

  static BoxShadow get extraLarge => BoxShadow(
        color: Color.fromARGB(40, 0, 0, 0),
        blurRadius: 16.r,
        offset: Offset(0, 12.r),
      );
}
```

These extensions represent:

- **`.sw`** – percentage of screen width
- **`.sh`** – percentage of screen height
- **`.sp`** – scalable font size
- **`.r`** – dimension/radius scaled to pixel density

## Module Structure

Every feature follows a similar structure based on DDD:

```
<feature>/
├── application     # State notifiers and use cases
├── domain          # Entities and enums
├── infrastructure  # Data transfer objects and repositories
├── presentation    # Screens and widgets
├── router.dart     # Typed routes
├── router.g.dart   # Generated router
└── shared          # Providers and constants
```

Main modules include `auth`, `onboarding`, `home`, `pets`, `reminders`, `users` and `preferences`. Each one works independently and is plugged into the global router.

## Localization

Localization uses `easy_localization`. The entry point configures the supported locales and initializes ScreenUtil:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  final sharedPrefs = await SharedPreferences.getInstance();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('es')],
      path: 'assets/lang',
      useOnlyLangCode: true,
      child: ScreenUtilInit(
        designSize: const Size(392.7, 872.7),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return ProviderScope(
            overrides: [
              sharedPreferencesProvider.overrideWithValue(sharedPrefs),
            ],
            child: child!,
          );
        },
        child: const AppWidget(),
      ),
    ),
  );
}
```

Strings are translated with `.tr()` or `.plural()` using keys from `assets/lang`:

```dart
final bool canResend = !loading && _secondsRemaining == 0;
final String buttonText = _secondsRemaining > 0
    ? 'resendInValue'.plural(_secondsRemaining, args: [_secondsRemaining.toString()])
    : 'send'.tr();
```

Translations can be organized in sub‑folders, for example:

```
assets/lang/
├── auth/en.json
├── auth/es.json
├── pets/en.json
├── pets/es.json
```

Point the `path` in `EasyLocalization` to the parent directory so all nested files are loaded automatically.

## License

MIT


