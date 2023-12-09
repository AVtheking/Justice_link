import 'package:flutter/material.dart';
import 'package:justice_link/features/medical_updates/widgets/file_pick_button.dart';

class FilePickContainer extends StatelessWidget {
  final VoidCallback onAddFilePressed;
  final String title;

  const FilePickContainer(
      {Key? key, required this.onAddFilePressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 329,
      height: 77,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
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
             Text(
              title,
              style:const TextStyle(
                fontFamily: 'Inter',
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
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
