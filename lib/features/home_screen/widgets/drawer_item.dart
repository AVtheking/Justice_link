import 'package:flutter/material.dart';
import 'package:justice_link/common/future.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.icon, required this.text});
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.asset(
          scale: 0.9,
          icon,
          height: 50,
          width: 30,
          // colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
        ),
        title: TranslateText(
          englishText: text,
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ));
  }
}
