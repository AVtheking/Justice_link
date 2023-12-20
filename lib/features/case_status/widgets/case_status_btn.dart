import 'package:flutter/material.dart';

class CaseStatusButton extends StatelessWidget {
  const CaseStatusButton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      margin: const EdgeInsets.symmetric(horizontal: 19),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
          colors: [Color(0xFF046200), Color(0xFF098904)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.remove_red_eye, color: Colors.white),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
