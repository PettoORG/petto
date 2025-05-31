// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $remindersRoute,
    ];

RouteBase get $remindersRoute => GoRouteData.$route(
      path: '/reminders',
      factory: $RemindersRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: ':reminderId',
          factory: $ReminderDetailRouteExtension._fromState,
        ),
      ],
    );

extension $RemindersRouteExtension on RemindersRoute {
  static RemindersRoute _fromState(GoRouterState state) =>
      const RemindersRoute();

  String get location => GoRouteData.$location(
        '/reminders',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ReminderDetailRouteExtension on ReminderDetailRoute {
  static ReminderDetailRoute _fromState(GoRouterState state) =>
      ReminderDetailRoute(
        reminderId: state.pathParameters['reminderId']!,
        $extra: state.extra as List<AppFileViewModel>?,
      );

  String get location => GoRouteData.$location(
        '/reminders/${Uri.encodeComponent(reminderId)}',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}
