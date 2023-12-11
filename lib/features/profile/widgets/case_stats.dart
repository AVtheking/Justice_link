import 'package:flutter/material.dart';

class CaseStats extends StatelessWidget {
  const CaseStats({super.key, required this.status, required this.color});
  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(

        // margin: const EdgeInsets.only(left: 280),
        height: 26,
        width: 83,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border(
            top: BorderSide(
              color: color,
              width: 1.0,
            ),
            right: BorderSide(
              color: color,
              width: 4.0,
            ),
            left: BorderSide(
              color: color,
              width: 1.0,
            ),
            bottom: BorderSide(
              color: color,
              width: 4.0,
            ),
          ),
        ),
        child: Center(
          child: Text(
            status,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFF004D14),
            ),
          ),
        ));
  }
}
