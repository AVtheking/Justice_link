import 'package:flutter/material.dart';

class CaseDetails extends StatelessWidget {
  const CaseDetails({super.key, required this.heading, required this.details});
  final String heading;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: const TextStyle(
                color: Color(0xFF046200),
                fontSize: 16,
                fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            details,
            style: const TextStyle(
              color: Color(0xFF3B3B3B),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider()
        ],
      ),
    );
  }
}
