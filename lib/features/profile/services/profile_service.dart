// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:justice_link/common/api_service.dart';
import 'package:justice_link/common/connectivity.dart';
import 'package:justice_link/common/snackbar.dart';
import 'package:justice_link/features/auth/services/auth_service.dart';
import 'package:justice_link/features/profile/screens/profile_screen.dart';
import 'package:justice_link/global.dart';
import 'package:justice_link/models/lawyer.dart';
import 'package:shared_preferences/shared_preferences.dart';

final profileServiceProvider = Provider((ref) => ProfileService(ref: ref));

class ProfileService {
  final Ref _ref;
  ProfileService({required Ref ref}) : _ref = ref;

  Future<void> updateProfile(
      {required BuildContext context,
      required String id,
      required String name,
      required String email,
      required String lawyerId,
      required String lawyerSkills,
      required String lawyerExperience,
      required String location,
      required String lawyerbio}) async {
          final bool _isConnected =await ConnectivityService().isConnected();
    if (!_isConnected) {
      showSnackBar(context, "No Internet Connection");
      return;
    }
    try {

      // print(uri);
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");
      http.Response res = await http.put(
        Uri.parse("$uri/lawyer/updateProfile"),
        body: jsonEncode({
          "id": id,
          "name": name,
          "email": email,
          "skills": lawyerSkills,
          "lawyerId": lawyerId,
          "lawyerExperience": lawyerExperience,
          "location": location,
          "bio": lawyerbio,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': "Bearer $token"
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Profile updated Successfully");
            final body = jsonDecode(res.body);
            final data = body['data'];
            final _lawyer = jsonEncode(data['lawyer']);
            _ref
                .read(lawyerProvider.notifier)
                .update((state) => Lawyer.fromJson(_lawyer));
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => const ProfileScreen()));
          });
    } catch (err) {
      // print(err);
      showSnackBar(context, err.toString());
    }
  }
}
