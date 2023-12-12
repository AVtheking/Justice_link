import 'package:flutter/material.dart';

class RegisterField extends StatefulWidget {
  const RegisterField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.icon,
      this.isVisible,
      this.maxlines,
      this.suffixIcon});
  final String hintText;
  final IconData? icon;
  final bool? isVisible;
  final bool? suffixIcon;
  final int? maxlines;
  final TextEditingController controller;

  @override
  State<RegisterField> createState() => _RegisterFieldState();
}

class _RegisterFieldState extends State<RegisterField> {
  @override
  Widget build(BuildContext context) {
    // print(widget.controller.text);
    return TextField(
      obscureText: widget.isVisible ?? false,
      maxLines: widget.maxlines ?? 1,
      controller: widget.controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          hintText: widget.hintText,
          prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
          // icon: Icon(Icons.person),
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
              borderRadius: BorderRadius.circular(10)),
          fillColor: Colors.white,
          filled: true,
        ),
    );
  }
}
