import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/common/future.dart';
import 'package:justice_link/features/guidelines/screens/guidelines.dart';
import 'package:justice_link/features/legal_rights/screens/legal_rights.dart';

class KeyFeatures extends ConsumerWidget {
  const KeyFeatures({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> features = [
      "Guidelines",
      "Legal rights",
    ];

    return Container(
      height: 111,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFE5E5E5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (index == 0) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Guidelines()),
                );
              } else if (index == 1) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LegalRights()),
                );
              }
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              width: 160,
              height: 90,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 21,
                      backgroundColor: const Color(0xFF046200),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: ClipRRect(
                          child: Image.asset(
                            "assets/key_features/$index.png",
                            width: 25,
                            height: 25,
                            color: const Color.fromARGB(255, 4, 76, 3),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TranslateText(
                      englishText: features[index],
                      style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 26, 30, 26),
                          fontWeight: FontWeight.w500))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
