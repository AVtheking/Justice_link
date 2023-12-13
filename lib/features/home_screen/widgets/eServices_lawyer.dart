import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/features/case_status/screens/case_status_lawyer.dart';
import 'package:justice_link/features/document_verification/screens/document_verification_screen.dart';
import 'package:justice_link/features/medical_updates/screens/medical_updates.dart';
import 'package:justice_link/features/meetings/screens/meeting_request.dart';

class EServicesLawyer extends ConsumerWidget {
  const EServicesLawyer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // List<String> eServices = [
    //   "Case Status",
    //   "Medical Updates",
    //   "Meetings",
    //   "UTRC connection",
    //   "Document Verfication",
    //   "Rehabilitation Program",
    // ];
    List<String> eServicesLawyer = [
      "Case Status",
      "Medical Updates",
      "Meeting Request",
      "UTRC connection",
      "Document Verfication",
      "Rehabilitation Program",
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: eServicesLawyer.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CaseStatusLawyer(),
                        ),
                      );
                    } else if (index == 1) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MedicalUpdates(),
                        ),
                      );
                    } else if (index == 2) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const MeetingRequest()),
                      );
                    } else if (index == 4) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DocumentVerification()));
                    }
                  },
                  child: Image.asset(
                    "assets/eServices_images/$index.png",
                    color: const Color.fromARGB(255, 4, 78, 1),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  eServicesLawyer[index],
                  style: const TextStyle(
                      color: Color.fromARGB(255, 34, 35, 34),
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                )
              ],
            );
          }),
    );
  }
}
