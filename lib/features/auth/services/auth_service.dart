// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:justice_link/common/api_service.dart';
import 'package:justice_link/common/snackbar.dart';
import 'package:justice_link/features/get_started/screens/get_started_screen.dart';
import 'package:justice_link/features/home_screen/screen/home_screen.dart';
import 'package:justice_link/global.dart';
import 'package:justice_link/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

final userProvider = StateProvider<User?>((ref) => null);

final authServiceProvider = Provider((ref) => AuthService(ref: ref));

class AuthService {
  final Ref _ref;
  AuthService({required Ref ref}) : _ref = ref;

  Future<void> register({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(name: name, email: email, password: password);
      // print(user.toJson());
      http.Response res = await http.post(
        Uri.parse("$uri/register"),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      // print(res);

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          showSnackBar(context, "Account Created Successfully");
          final body = jsonDecode(res.body);
          // print(body['data']);
          final data = body['data'];
          // print(data['user']);
          final _user = jsonEncode(data['user']);
          // print(_user);

          _ref.read(userProvider.notifier).update(
                (state) => User.fromJson(_user),
              );

          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString("token", data['token']);
          // print(pref);

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const GetStartedScreen(),
            ),
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    // print(email);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/login'),
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          showSnackBar(context, "Login Successful");
          final body = jsonDecode(res.body);
          final data = body['data'];
          final _user = jsonEncode(data['user']);

          _ref.read(userProvider.notifier).update(
                (state) => User.fromJson(_user),
              );

          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString("token", data['token']);

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> getUserData(BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString("token");
      if (token == null) {
        pref.setString("token", '');
      }
      http.Response res =
          await http.get(Uri.parse('$uri/user'), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': "Bearer $token"
      });
      final body = jsonDecode(res.body);
      final data = body['data'];
      final _user = jsonEncode(data['user']);
      _ref.read(userProvider.notifier).update(
            (state) => User.fromJson(_user),
          );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
