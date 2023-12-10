import 'package:flutter/material.dart';

class RegisterField extends StatefulWidget {
  const RegisterField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.icon,
      this.isVisible,
      this.suffixIcon});
  final String hintText;
  final IconData icon;
  final bool? isVisible;
  final bool? suffixIcon;
  final TextEditingController controller;

  @override
  State<RegisterField> createState() => _RegisterFieldState();
}

class _RegisterFieldState extends State<RegisterField> {
  @override
  Widget build(BuildContext context) {
    print(widget.controller.text);
    return TextField(
      obscureText: widget.isVisible ?? false,
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 2),
        hintText: widget.hintText,
        prefixIcon: Icon(widget.icon),
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
            borderSide: BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10)),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
