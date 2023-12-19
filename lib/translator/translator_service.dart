// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:justice_link/common/api_service.dart';

final translatorProvider = Provider((ref) => Translator(ref: ref));

class Translator {
  final Ref _ref;
  Translator({required Ref ref}) : _ref = ref;

  Future<String> translate(
      {required String text,
      required BuildContext context,
      required String lang}) async {
    String translatedText = "";
    print(lang);
    http.Response res = await http.post(
      Uri.parse("https://bhashini.anaskhan.site/api/translate/${lang}/"),
      body: jsonEncode({
        "text": text,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
    print(res.body);
    httpErrorHandle(
      response: res,
      context: context,
      onSuccess: () {
        final body = jsonDecode(res.body);
        translatedText = body['text'];
        print(translatedText);
      },
    );
    return translatedText;
  }
}
