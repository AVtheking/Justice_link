import 'package:flutter/material.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/features/meetings/widgets/lawyer_card.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  var _calendarController = TextEditingController();

  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfun("Book an appointment"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LawyerCard(),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TableCalendar(
                
                focusedDay: DateTime.now(),
                firstDay: DateTime(1990),
                lastDay: DateTime(2050),
                onDaySelected: (selectedDay, focusedDay) => setState(() {
                  _calendarController.text =
                      selectedDay.toIso8601String().split('T')[0];
                }),
                selectedDayPredicate: (day) {
                  return isSameDay(day, DateTime.now());
                },
                // Customize your calendar options here
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Implement your submit logic here
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
