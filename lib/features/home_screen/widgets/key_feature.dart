import 'package:flutter/material.dart';

class KeyFeatures extends StatelessWidget {
  const KeyFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 111,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFE5E5E5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            width: 72,
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
                          "assets/key_features/0.png",
                          width: 25,
                          height: 25,
                          color: const Color.fromARGB(255, 4, 76, 3),
                        ),
                      ),
                    ),
                  ),
                ),
                const Text(
                  "Guidelines",
                  style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 26, 30, 26),
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
