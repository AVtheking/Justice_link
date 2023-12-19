import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/features/chat/screens/chat_screen.dart';
import 'package:justice_link/features/meetings/screens/appointment_payment.dart';
import 'package:justice_link/features/meetings/services/meeting_service.dart';
import 'package:justice_link/models/lawyer.dart';
import 'package:justice_link/models/meeting.dart';

class LawyerCard extends ConsumerStatefulWidget {
  const LawyerCard({Key? key, required this.lawyer}) : super(key: key);
  final Lawyer lawyer;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LawyerCardState();
}

class _LawyerCardState extends ConsumerState<LawyerCard> {
  Meeting? meeting;
  Future<void> getMeetingRequest(BuildContext context, String lawyerId) async {
    final fetchedMeeting = await ref
        .read(meetingServiceProvider)
        .getMeetingRequests(context, lawyerId);
    if (mounted) {
      setState(() {
        meeting = fetchedMeeting;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getMeetingRequest(context, widget.lawyer.id!);
  }

  @override
  Widget build(BuildContext context) {
    // final meeting = ref.watch(meetingProvider);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => meeting != null
                ? ChatScreen(meeting: meeting)
                : AppointmentPayment(lawyer: widget.lawyer),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: IntrinsicHeight(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: meeting == null
                  ? Colors.white
                  : meeting!.lawyerId == widget.lawyer.id
                      ? meeting!.meetingStatus == "pending"
                          ? const Color.fromARGB(255, 243, 222, 35)
                          : meeting!.meetingStatus == "accepted"
                              ? const Color.fromARGB(255, 128, 241, 132)
                              : meeting!.meetingStatus == "rejected"
                                  ? Colors.red
                                  : Colors.white
                      : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 20,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/lawyer.png",
                          width: 70,
                          height: 100,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                widget.lawyer.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF046200),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: Color.fromARGB(255, 90, 90, 92),
                                  size: 20,
                                ),
                                Text(
                                  widget.lawyer.location == null
                                      ? "Ahmedabad, Gujarat"
                                      : widget.lawyer.location!,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 75, 77, 81),
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.work_outline,
                                  color: Color.fromARGB(255, 90, 90, 92),
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  widget.lawyer.lawyerExperience == null
                                      ? "5 years"
                                      : "${widget.lawyer.lawyerExperience} ",
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 61, 63, 65),
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const IntrinsicHeight(
                              child: Stack(children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.chat_outlined,
                                      color: Color.fromARGB(255, 111, 111, 114),
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Hindi, English, Gujarati",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 67, 69, 72),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                              ]),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text(
                          "Skills &\nLearnings:",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF046200),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black54),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      widget.lawyer.skills == null
                                          ? "Criminal Law"
                                          : widget.lawyer.skills!,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 3,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black54),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Text(
                                      "Property&Real Estates",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black54),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Text(
                                      "+ 2 more",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
