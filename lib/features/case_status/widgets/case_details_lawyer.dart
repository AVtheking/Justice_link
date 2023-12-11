import 'package:flutter/material.dart';

class CaseDetailsLawyer extends StatefulWidget {
  const CaseDetailsLawyer(
      {super.key,
      required this.heading,
      required this.hintText,
      required this.controller});
  final String heading;
  final String hintText;
  final TextEditingController controller;

  @override
  State<CaseDetailsLawyer> createState() => _CaseDetailsLawyerState();
}

class _CaseDetailsLawyerState extends State<CaseDetailsLawyer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.heading,
            style: const TextStyle(
                color: Color(0xFF046200),
                fontSize: 16,
                fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              hintText: widget.hintText,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF046200),
                ),
              ),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
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
