// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    var _selectedDay = DateTime.now();
    var _focusedDay = DateTime.now();

    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: DateTime(1990),
      lastDay: DateTime(2050),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      calendarStyle: CalendarStyle(
        // isTodayHighlighted: false,

        selectedDecoration: const BoxDecoration(
          color: Color(0xFF046200),
          shape: BoxShape.rectangle,
        ),
        todayDecoration: BoxDecoration(
          color: const Color.fromARGB(255, 239, 241, 239),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: const Color(0xFF046200),
            width: 2,
          ),
        ),
        todayTextStyle: const TextStyle(
          color: Color.fromARGB(255, 47, 47, 47),
          fontWeight: FontWeight.bold,
        ),
        selectedTextStyle: const TextStyle(color: Colors.white),
      ),
      headerStyle: const HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
      ),

      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      // Customize your calendar options here
    );
  }
}
