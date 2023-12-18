// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CaseDetailText extends StatelessWidget {
  const CaseDetailText({
    super.key,
    required this.heading,
    required this.detail,
  });
  final String heading;
  final String detail;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: heading,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                // fontSize: 10,
                color: Colors.black),
          ),
          TextSpan(text: detail, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
