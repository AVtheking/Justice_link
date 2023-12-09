import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:justice_link/features/medical_updates/widgets/file_pick_container.dart';

class MedicalUpdates extends StatefulWidget {
  const MedicalUpdates({Key? key}) : super(key: key);

  @override
  State<MedicalUpdates> createState() => _MedicalUpdatesState();
}

class _MedicalUpdatesState extends State<MedicalUpdates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
        title: const Text("Medical Updates"),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(255, 72, 73, 72),
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Color(0xFF046200)),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 329,
              height: 81,
              margin: const EdgeInsets.only(top: 30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(9, 0, 0, 0),
                    child: Image.asset(
                      'assets/images/Group.png',
                      width: 60,
                      height: 60,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Manoj Kumar',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.0,
                            color: Color(0xFF046200),
                          ),
                        ),
                        Text('Ward No . : 420'),
                        Text('Appointed Doctor : Dr. KK Menon')
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 49,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(9, 3, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  FilePickContainer(
                    title: "Medical Reports",
                    onAddFilePressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 49,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(9, 3, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  FilePickContainer(
                    title: "Prescription Medication",
                    onAddFilePressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 49,
            ),
            Container(
              width: 329,
              height: 77,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(9, 3, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next Scheduled on:',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text("Date: 12/12/2021",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    Text("Doctor Appointed: Rajesh Yadav",
                        style: TextStyle(fontWeight: FontWeight.w500))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
