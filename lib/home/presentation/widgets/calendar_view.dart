import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
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
          availableCalendarFormats: const {
            CalendarFormat.month: 'Mensual',
            CalendarFormat.twoWeeks: '2 Semanas',
            CalendarFormat.week: 'Semanal',
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
        const Expanded(
          child: Center(child: Text('Lista de recordatorios')),
        ),
      ],
    );
  }
}
