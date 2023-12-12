// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:http/http.dart" as http;
import 'package:justice_link/common/api_service.dart';
import 'package:justice_link/common/snackbar.dart';
import 'package:justice_link/global.dart';
import 'package:justice_link/models/lawyer.dart';
import 'package:shared_preferences/shared_preferences.dart';

final meetingServiceProvider = Provider((ref) => MeetingService(ref: ref));

class MeetingService {
  final Ref _ref;
  MeetingService({required Ref ref}) : _ref = ref;

  Future<List<Lawyer>> getAllLawyers(BuildContext context) async {
    List<Lawyer> lawyers = [];
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");

      http.Response res = await http.get(
        Uri.parse("$uri/all-lawyers"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': "Bearer $token"
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            final body = jsonDecode(res.body);
            final data = body['data'];
            final lawyersData = data['lawyers'];
            for (int i = 0; i < lawyersData.length; i++) {
              final String _lawyer = jsonEncode(lawyersData[i]);
              // print(_lawyer);  
              lawyers.add(Lawyer.fromJson(_lawyer));
            }
          });
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
    return lawyers;
  }
}
