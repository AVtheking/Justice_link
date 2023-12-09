import 'package:flutter/material.dart';
import 'package:justice_link/features/medical_updates/widgets/file_pick_button.dart';
import 'package:justice_link/features/case_status/widgets/rich_text.dart';
class RequiredDocuments extends StatelessWidget {
  final VoidCallback onAddFilePressed;
  final String title;

  const RequiredDocuments(
      {Key? key, required this.onAddFilePressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 329,
      height: 66,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            spreadRadius: 0.0,
            offset: Offset(0.0, 0.0),
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(9, 3, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
            
               Case_status(text: title),
            ]),
            const SizedBox(
              height: 4,
            ),
            MyElevatedButton(
              onPressed: onAddFilePressed,
              borderRadius: BorderRadius.circular(10),
              child: const Text(
                '+ Add File ',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
