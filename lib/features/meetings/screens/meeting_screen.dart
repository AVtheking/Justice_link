import 'package:flutter/material.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/features/meetings/screens/appointment_payment.dart';
import 'package:justice_link/features/meetings/widgets/lawyer_card.dart';

class Meeting extends StatelessWidget {
  const Meeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfun("Meetings"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AppointmentPayment()));
                },
                child: LawyerCard()),
            LawyerCard(),
            LawyerCard(),
            LawyerCard(),
            LawyerCard(),
          ],
        ),
      ),
    );
  }
}
