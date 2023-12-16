import 'package:flutter/material.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/features/meetings/screens/appointment_screen.dart';
import 'package:justice_link/features/meetings/widgets/lawyer_card.dart';
import 'package:justice_link/models/lawyer.dart';

class AppointmentPayment extends StatefulWidget {
  const AppointmentPayment({super.key, required this.lawyer});
  final Lawyer lawyer;

  @override
  State<AppointmentPayment> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentPayment> {
  int selectedOption = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfun("Book an appointment"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LawyerCard(
              lawyer: widget.lawyer,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Container(
                      width: 180,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: selectedOption == 1
                            ? const LinearGradient(
                                colors: [Color(0xFF004D14), Color(0xFF098904)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              )
                            : null,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: 1,
                          ),
                        ],
                        color: selectedOption == 1 ? null : Colors.white,
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: selectedOption,
                              fillColor: selectedOption == 1
                                  ? MaterialStateProperty.all(Colors.white)
                                  : MaterialStateProperty.all(
                                      const Color(0xFF004D14),
                                    ),
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value as int;
                                });
                              },
                            ),
                            Text(
                              "Probono Lawyer",
                              style: TextStyle(
                                color: selectedOption == 1
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 1,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Container(
                      width: 160,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: selectedOption == 2
                            ? const LinearGradient(
                                colors: [Color(0xFF004D14), Color(0xFF098904)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              )
                            : null,
                        color: selectedOption == 2 ? null : Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Radio(
                            fillColor: selectedOption == 2
                                ? MaterialStateProperty.all(Colors.white)
                                : const MaterialStatePropertyAll(
                                    Color(0xFF004D14),
                                  ),
                            value: 2,
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value as int;
                              });
                            },
                          ),
                          Text(
                            "Lawyer",
                            style: TextStyle(
                              color: selectedOption == 2
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
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
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Overview",
                          style: TextStyle(color: Color(0xFF046200)),
                        ),
                        Text(
                          "Advocate Sudershani has since been practicing and handling cases independently with a result oriented approach, both professionally and ethically and has now acquired 8 years of professional experience in providing legal consultancy and advisory services. She has completed her BA.LLB(Hons) from Jamia Millia Islamia and has been practicing and handling cases independently and provides legal consultancy and advisory services.Advocate Sudershani provides services in various field of civil as well as corporate laws, inter-alia, Suits, Writs, Petitions, Appeals, Revisions, Complaints relating to debt recovery, dishonor of cheques, rent control act, property disputes, matrimonial disputes, consumer complaints, complaints pertaining to Food Adulteration Act and service matter . In addition to this she is skilled in drafting and vetting various kinds of agreement such as Master Service Agreement, Service Agreement, Teaming Agreement, Consortium Agreement, various Tripartite Agreement, RFQs, Letter of Intent, MOU, Agreement with Celebrity, Endorsement Agreement, License Agreement, Sub-Licensing Agreement, Sub-Contracting, Third Party Agreement, Sale Deed, Corporate Lease Agreement, Development Agreement(Real estate), broadcasting agreement.",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFADADAD),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(children: [
                const Text(
                  "Charges Per Appointmemt:",
                  style: TextStyle(
                    color: Color(0xFF046200),
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                selectedOption == 1 ? const Text("0") : const Text("1500")
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AppointmentScreen(
                      isProbono: selectedOption == 1 ? true : false,
                      lawyer: widget.lawyer,
                    ),
                  ),
                );
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF046200),
                      Color(0xFF098904),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      "assets/images/appointment.png",
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Book an appointment",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
