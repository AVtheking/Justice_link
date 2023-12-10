import 'package:flutter/material.dart';
import 'dart:async';

import 'package:open_file_plus/open_file_plus.dart';

class ViewFile extends StatefulWidget {
  final String filePath;

  const ViewFile({Key? key, required this.filePath}) : super(key: key);

  @override
  State<ViewFile> createState() => _ViewFileState();
}

class _ViewFileState extends State<ViewFile> {
  var _openResult = 'Unknown';

  Future<void> openFile() async {
    final result = await OpenFile.open(widget.filePath);

    setState(() {
      _openResult = "type=${result.type}  message=${result.message}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('View File'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('open result: $_openResult\n'),
              TextButton(
                onPressed: openFile,
                child: const Text('Tap to open file'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
