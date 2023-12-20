import 'package:flutter/material.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/common/symbol.dart';
import 'package:justice_link/features/meetings/screens/pyament_successful.dart';
import 'package:justice_link/features/meetings/widgets/appointment_btn.dart';
import 'package:justice_link/features/meetings/widgets/lawyer_card.dart';
import 'package:justice_link/models/lawyer.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    Key? key,
    required this.lawyer,
    this.isProbono = false,
  }) : super(key: key);
  final Lawyer lawyer;
  final bool isProbono;

  @override
  State<PaymentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<PaymentScreen> {
  void naviggateToPayment() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PaymentSuccessFul(lawyer: widget.lawyer),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfun("Book an appointment"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LawyerCard(
            lawyer: widget.lawyer,
          ),
          const SizedBox(height: 20),
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
                    decoration: const BoxDecoration(
                      color: Color(0xFFD9D9D9),
                    ),
                    child: const Center(
                      child: Text(
                        "Summary",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Service Fee:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        widget.isProbono == false
                            ? const Text(
                                "$ruppeeSymbol 1500",
                                style: TextStyle(fontSize: 16),
                              )
                            : const Text(
                                "$ruppeeSymbol 0",
                                style: TextStyle(fontSize: 16),
                              )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "GST:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.isProbono == false
                              ? "$ruppeeSymbol 100"
                              : "$ruppeeSymbol 0",
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.isProbono == false
                              ? "$ruppeeSymbol 1600"
                              : "$ruppeeSymbol 0",
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      "assets/images/payment.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 100),
              child:
                  AppointmemtButton(text: "Pay Now", onTap: naviggateToPayment))
        ],
      ),
    );
  }
}
