import 'package:flutter/material.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/common/symbol.dart';
import 'package:justice_link/features/meetings/screens/meeting_detail.dart';
import 'package:justice_link/features/meetings/widgets/lawyer_card.dart';
import 'package:justice_link/models/lawyer.dart';

class PaymentSuccessFul extends StatefulWidget {
  const PaymentSuccessFul({Key? key, required this.lawyer}) : super(key: key);
  final Lawyer lawyer;

  @override
  State<PaymentSuccessFul> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<PaymentSuccessFul> {
  void naviggateToPayment() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PaymentSuccessFul(
          lawyer: widget.lawyer,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfun("Book an appointment"),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LawyerCard(
              lawyer: widget.lawyer,
            ),
            // const SizedBox(height: 20),
            Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 20,
                        spreadRadius: 1,
                      )
                    ]),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFD9D9D9),
                      ),
                      child: const Center(
                        child: Text(
                          "Summary",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "$ruppeeSymbol 1600",
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Image.asset("assets/images/pay.png"),
            const Text("Meeting is scheduled with the lawyer"),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => MeetingDetails(lawyer: widget.lawyer)));
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromARGB(255, 181, 178, 178))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/robot.png",
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 20),
                          const Text(
                            "Chat with the lawyer",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        "Our lawyer will connect to you as soon as possible ",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                "assets/images/par.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
