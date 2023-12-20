// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final translatorProvider = Provider((ref) => Translator(ref: ref));

class Translator {
  final Ref _ref;
  Translator({required Ref ref}) : _ref = ref;

  Future<String> translate({
    required String textString,
    required BuildContext context,
    required String lang,
  }) async {
    String translatedText = "";
    print(lang);

    http.Response res = await http.post(
      Uri.parse('https://bhashini.anaskhan.site/api/translate/$lang/'),
      body: jsonEncode({
        'text': textString,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    // Decode the response body
    String decodedBody = utf8.decode(res.bodyBytes);
    print(decodedBody);

    final body = jsonDecode(decodedBody);
    print(body);

    if (res.statusCode == 200) {
      translatedText = body["text"];
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error translating"),
        ),
      );
    }

    return translatedText;
  }
}
