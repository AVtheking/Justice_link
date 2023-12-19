// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final Function(String)? onFilePicked;
  final Widget child;

  const MyElevatedButton({
    Key? key,
    required this.onFilePicked,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 34.0,
    this.gradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF004D14), Color(0xFF098904)],
    ),
  }) : super(key: key);

  Future<void> _pickFile(BuildContext context) async {
    // FilePickerResult? result = await FilePicker.platform.pickFiles();

    // if (result != null) {
    //   String filePath = result.files.single.path ?? '';

    //   if (onFilePicked != null) {
    //     onFilePicked!(filePath);
    //   }
    // } else {}
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    String filePath = image!.path;
    if (onFilePicked != null) {
      onFilePicked!(filePath);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(10);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: () => _pickFile(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}
