import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar appbarfun(String title) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    ),
    centerTitle: true,
    elevation: 5,
    backgroundColor: Colors.white,
    shadowColor: const Color.fromARGB(255, 72, 73, 72),
    systemOverlayStyle:
        const SystemUiOverlayStyle(statusBarColor: Color(0xFF046200)),
  );
}
