# Petto

Petto is a Flutter application for managing pets and reminders. The project is organized using Domain-Driven Design (DDD) and relies heavily on code generation.

## Code Generation

Code is generated with `build_runner` alongside packages such as `freezed`, `riverpod_generator` and `go_router_builder`. Generated files (`.g.dart`, `.freezed.dart`) should never be edited manually.

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

A small Riverpod example:

```dart
@riverpod
Future<List<Pet>> pets(PetsRef ref) => ref.watch(petsRepository).fetchPets();
```

## Routing

Navigation uses `go_router`. Each feature exposes typed routes that are added to `AppRouter`.

```dart
final router = GoRouter(
  routes: [
    ...auth.$appRoutes,
    ...pets.$appRoutes,
  ],
);
```

## Theme

`AppTheme` defines the light and dark themes. Colors come from `AppThemeColor` and spacing values from `AppThemeSizes`. Text styles scale with `ScreenUtil` so fonts adapt across devices.

```dart
final textTheme = Theme.of(context).textTheme.titleMedium!;
```

## Spacing and Sizing

`AppThemeSizes` centralizes spacing, radii and shadows. Values rely on ScreenUtil extensions:

- `.sw` – percentage of screen width
- `.sh` – percentage of screen height
- `.sp` – scalable font size
- `.r`  – dimension or radius scaled to pixel density

Example:

```dart
Padding(
  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
  child: Text('Responsive text', style: TextStyle(fontSize: 14.sp)),
);
```

## Module Structure

Every feature follows this folder layout:

```
<module>/
├── application     # State notifiers and use cases
├── domain          # Entities
├── infrastructure  # DTOs and repositories
├── presentation    # Screens and widgets
└── router.dart     # Typed routes
```

Modules such as `auth`, `onboarding`, `home`, `pets`, `reminders`, `users` and `preferences` work independently and are combined in the global router.

## Localization

Localization uses `easy_localization` with JSON files under `assets/lang`. Translate texts or numbers with `.tr()` or `.plural()`:

```dart
'hello'.tr();                      // simple translation
'countMessages'.plural(3);         // pluralization example
formatNumber(12345, locale: context.locale);
```

Organize translations in sub‑folders:

```
assets/lang/
├── auth/en.json
├── auth/es.json
├── pets/en.json
└── pets/es.json
```

Set the `path` in `EasyLocalization` to the parent folder so nested files are loaded automatically.

## License

MIT
