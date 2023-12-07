import 'package:flutter/material.dart';

class CaseResult extends StatelessWidget {
  const CaseResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        // alignment: Alignment.centerRight,
        margin: const EdgeInsets.only(left: 280),
        height: 26,
        width: 93,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: const Border(
            top: BorderSide(
              color: Color(0xFF004D14), // Dark green color
              width: 1.0, // Width of the top border
            ),
            right: BorderSide(
              color: Color(0xFF004D14), // Dark green color
              width: 4.0, // Width of the top border
            ),
            left: BorderSide(
              color: Color(0xFF004D14), // Dark green color
              width: 1.0, // Width of the left border
            ),
            bottom: BorderSide(
              color: Color(0xFF004D14), // Color for the bottom border
              width: 4.0, // Width of the bottom border
              // style: BorderStyle.solid, // Style of the bottom border
            ),
          ),
        ),
        child: const Center(
          child: Text(
            "WON",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF004D14),
            ),
          ),
        ));
  }
}
