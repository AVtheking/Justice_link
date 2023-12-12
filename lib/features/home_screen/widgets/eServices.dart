// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/features/auth/services/auth_service.dart';
import 'package:justice_link/features/case_status/screens/case_status.dart';
import 'package:justice_link/features/document_verification/screens/document_verification_screen.dart';
import 'package:justice_link/features/medical_updates/screens/medical_updates.dart';
import 'package:justice_link/features/meetings/screens/meeting_screen.dart';
import 'package:justice_link/features/rehabilation/screens/rehabilation_screen.dart';

class EServices extends ConsumerWidget {
  const EServices({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> eServices = [
      "Case Status",
      "Medical Updates",
      "Meetings",
      "UTRC connection",
      "Document Verfication",
      "Rehabilitation Program",
    ];

    final lawyer = ref.read(lawyerProvider);
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
                    } else if (index == 2) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Meeting(),
                        ),
                      );
                    } else if (index == 4) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DocumentVerification()));
                    } else if (index == 5) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const RehabilationScreen()));
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
