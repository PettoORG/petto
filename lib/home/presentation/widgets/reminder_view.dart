import 'package:flutter/material.dart';
import 'package:petto/reminders/router.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:easy_localization/easy_localization.dart';

class ReminderView extends StatefulWidget {
  const ReminderView({super.key});

  @override
  State<ReminderView> createState() => _ReminderViewState();
}

class _ReminderViewState extends State<ReminderView> {
  // Current month/week in view
  late DateTime _focusedDay;
  // Last tapped day (nullable)
  DateTime? _selectedDay;
  // Calendar format controller
  CalendarFormat _calendarFormat = CalendarFormat.month;

  // Range: today - 10 years  ←→  today + 15 years
  late final DateTime _firstDay;
  late final DateTime _lastDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _firstDay = DateTime(
      DateTime.now().year - 10,
      DateTime.now().month,
      DateTime.now().day,
    );
    _lastDay = DateTime(
      DateTime.now().year + 15,
      DateTime.now().month,
      DateTime.now().day,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        TableCalendar(
          firstDay: _firstDay,
          lastDay: _lastDay,
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            setState(() => _calendarFormat = format);
          },
          onPageChanged: (focusedDay) => _focusedDay = focusedDay,
          availableCalendarFormats: {
            CalendarFormat.month: 'calendarFormatEnum.month'.tr(),
            CalendarFormat.twoWeeks: 'calendarFormatEnum.twoWeeks'.tr(),
            CalendarFormat.week: 'calendarFormatEnum.week'.tr(),
          },
          headerStyle: HeaderStyle(
            titleCentered: true,
            formatButtonVisible: true,
            formatButtonDecoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            formatButtonTextStyle: TextStyle(color: colorScheme.onPrimary),
          ),
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: colorScheme.secondary,
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            selectedTextStyle: TextStyle(color: colorScheme.onPrimary),
            todayTextStyle: TextStyle(color: colorScheme.onPrimaryContainer),
          ),
        ),
        // Placeholder content
        Center(
          child: ElevatedButton(
            onPressed: () => ReminderDetailRoute(reminderId: '0').push(context),
            child: Text('addReminder'.tr()),
          ),
        ),
      ],
    );
  }
}
