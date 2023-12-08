import 'package:flutter/material.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/features/meetings/widgets/calender_card.dart';
import 'package:justice_link/features/meetings/widgets/lawyer_card.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  var _selectedDay = DateTime.now();
  var _focusedDay = DateTime.now();

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
              child: Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 20,
                          spreadRadius: 1),
                    ],
                  ),
                  child: Column(
                    children: [
                    const   Calender(),
                      Container(
                        width: 114,
                        height: 28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF004D14),
                              Color(0xFF098904),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child:const Center(
                          child:  Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
