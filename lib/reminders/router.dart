import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petto/core/files/application/app_file_view_model.dart';
import 'package:petto/reminders/presentation/screens/reminder_details_screen.dart';
import 'package:petto/reminders/presentation/screens/reminder_list_screen.dart';

part 'router.g.dart';

/// Parent route for the reminders feature.
@TypedGoRoute<RemindersRoute>(
  path: '/reminders',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<ReminderDetailRoute>(path: ':reminderId'),
  ],
)
class RemindersRoute extends GoRouteData {
  const RemindersRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const RemindersListScreen();
}

/// Detail screen – shows one reminder by id and attached files.
class ReminderDetailRoute extends GoRouteData {
  const ReminderDetailRoute({
    required this.reminderId,
    List<AppFileViewModel>? $extra,
  }) : $extra = $extra ?? const [];

  /// Path parameter.
  final String reminderId;

  /// Files sent via `extra`.
  final List<AppFileViewModel> $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) => ReminderDetailsScreen(id: reminderId, files: $extra);
}
