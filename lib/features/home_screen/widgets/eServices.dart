import 'package:flutter/material.dart';
import 'package:justice_link/features/case_status/screens/case_status.dart';
import 'package:justice_link/features/medical_updates/screens/medical_updates.dart';
import 'package:justice_link/features/meetings/screens/meeting_screen.dart';

class EServices extends StatelessWidget {
  const EServices({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> eServices = [
      "Case Status",
      "Medical Updates",
      "Need Help",
      "Meetings",
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
              crossAxisCount: 4,
              childAspectRatio: 1,
              // crossAxisSpacing: 5,
              mainAxisSpacing: 10),
          itemCount: eServices.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CaseStatus(),
                        ),
                      );
                    } else if (index == 1) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MedicalUpdates(),
                        ),
                      );
                    } else if (index == 3) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Meeting(),
                        ),
                      );
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
                  eServices[index],
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
