import 'package:flutter/material.dart';

class MeetingFormField extends StatefulWidget {
  const MeetingFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.icon,
    this.isVisible,
    this.maxlines,
    this.suffixIcon,
  }) : super(key: key);

  final String hintText;
  final IconData? icon;
  final bool? isVisible;
  final bool? suffixIcon;
  final int? maxlines;
  final TextEditingController controller;

  @override
  State<MeetingFormField> createState() => _RegisterFieldState();
}

class _RegisterFieldState extends State<MeetingFormField> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      // height: 60, // Set a fixed height here
      child: TextFormField(
        obscureText: widget.isVisible ?? false,
        maxLines: widget.maxlines ?? 1,
        controller: widget.controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          hintText: widget.hintText,
          prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
