// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/features/meetings/screens/payment.dart';
import 'package:justice_link/features/meetings/widgets/appointment_btn.dart';
import 'package:justice_link/features/meetings/widgets/lawyer_card.dart';
import 'package:justice_link/models/lawyer.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen(
      {Key? key, required this.lawyer, this.isProbono = false})
      : super(key: key);
  final Lawyer lawyer;
  final bool isProbono;

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  late DateTime _selectedDateTime;

  @override
  void initState() {
    super.initState();
    _selectedDateTime = DateTime.now();
  }

  void navigateToPayment() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PaymentScreen(
          lawyer: widget.lawyer,
          isProbono:widget.isProbono
        ),
      ),
    );
  }

  Future<void> _selectDateAndTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            inputDecorationTheme: const InputDecorationTheme(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFF004D14),
                        width: 2.0,
                        style: BorderStyle.solid))),
            primaryColor: const Color(0xFF046200),
            colorScheme: ColorScheme.light(
              primary: const Color(0xFF046200), // Active text color
              onPrimary: Colors.white, // Active text color
              surface:
                  const Color(0xFF046200).withOpacity(0.1), // Background color
              onSurface: Colors.black, // Text color
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary, // Button text color
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: const Color(0xFF046200), // Header background color

              colorScheme: ColorScheme.light(
                primary: const Color(0xFF046200), // Active text color
                onPrimary: Colors.white, // Active text color
                surface: Colors.white.withOpacity(1), // Background color
                onSurface: Colors.black, // Text color
              ),
              buttonTheme: const ButtonThemeData(
                textTheme: ButtonTextTheme.primary, // Button text color
              ),
            ),
            child: child!,
          );
        },
      );
      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfun("Book an appointment"),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LawyerCard(
            lawyer: widget.lawyer,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 20,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        'Selected Date and Time:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        DateFormat('yyyy-MM-dd HH:mm')
                            .format(_selectedDateTime),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                        title: const Text(
                          'Select Date and Time',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF046200),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          _selectDateAndTime(context);
                        }),
                    AppointmemtButton(
                      text: "Continue",
                      onTap: navigateToPayment,
                    )
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              "assets/images/par.png",
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
