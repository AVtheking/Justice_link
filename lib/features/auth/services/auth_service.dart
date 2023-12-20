// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers, empty_catches

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:justice_link/common/api_service.dart';
import 'package:justice_link/common/connectivity.dart';
import 'package:justice_link/common/snackbar.dart';
import 'package:justice_link/features/auth/screens/sign_up.dart';
import 'package:justice_link/features/home_screen/screen/home_screen.dart';
import 'package:justice_link/features/home_screen/screen/home_screen_lawyer.dart';
import 'package:justice_link/global.dart';
import 'package:justice_link/models/lawyer.dart';
import 'package:justice_link/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

final userProvider = StateProvider<User?>((ref) => null);
final lawyerProvider = StateProvider<Lawyer?>((ref) => null);

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
      final bool _isConnected = await ConnectivityService().isConnected();
      User user = User(name: name, email: email, password: password);
      // print(user.toJson());
      if (!_isConnected) {
        showSnackBar(context, "No Internet Connection");
        return;
      }
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
              builder: (context) => const HomeScreen(),
            ),
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> registerLawyer({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
      final bool _isConnected =await ConnectivityService().isConnected();
      if (!_isConnected) {
        showSnackBar(context, "No Internet Connection");
        return;
      }
    try {
      Lawyer lawyer = Lawyer(
        name: name,
        email: email,
        password: password,
      );
      // print(lawyer.toJson());
      http.Response res = await http.post(
        Uri.parse("$uri/lawyer/register"),
        body: lawyer.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          showSnackBar(context, "Account Created Successfully");
          final body = jsonDecode(res.body);
          // print(body);
          final data = body['data'];

          final _lawyer = jsonEncode(data['lawyer']);

          _ref.read(lawyerProvider.notifier).update(
                (state) => Lawyer.fromJson(_lawyer),
              );

          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString("token", data['token']);

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreenLawyer(),
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
      final bool _isConnected =await ConnectivityService().isConnected();
      if (!_isConnected) {
        showSnackBar(context, "No Internet Connection");
        return;
      }
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

  void logOut(BuildContext context) async {
    
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("token", '');
      _ref.read(userProvider.notifier).update((state) => null);
      _ref.read(lawyerProvider.notifier).update((state) => null);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Register()),
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> loginLawyer({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
      final bool _isConnected =await ConnectivityService().isConnected();
      if (!_isConnected) {
        showSnackBar(context, "No Internet Connection");
        return;
      }
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/lawyer/login'),
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
          final _lawyer = jsonEncode(data['lawyer']);

          _ref.read(lawyerProvider.notifier).update(
                (state) => Lawyer.fromJson(_lawyer),
              );
          // print(data['token']);

          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString("token", data['token']);

          // Navigator.of(context).pushReplacement(
          //   MaterialPageRoute(
          //     builder: (context) => const HomeScreenLawyer(),
          //   ),
          // );
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (ctx) => const HomeScreenLawyer()),
              (route) => false);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> getUserData(BuildContext context) async {
      // final bool _isConnected =await ConnectivityService().isConnected();
      // if (!_isConnected) {
      //   showSnackBar(context, "No Internet Connection");
      //   return;
      // }
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString("token");
      if (token == null) {
        pref.setString("token", '');
      }
      // print(token);
      http.Response res =
          await http.get(Uri.parse('$uri/user'), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': "Bearer $token"
      });
      // print(res.body);
      final body = jsonDecode(res.body);
      final data = body['data'];
      final _user = jsonEncode(data['user']);
      _ref.read(userProvider.notifier).update(
            (state) => User.fromJson(_user),
          );
    } catch (e) {
      // showSnackBar(context, e.toString());
    }
  }

  Future<void> getLawyerData() async {
    

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString("token");
      if (token == null) {
        pref.setString("token", '');
      }

      http.Response res = await http.get(
        Uri.parse('$uri/lawyer/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': "Bearer $token"
        },
      );

      final body = jsonDecode(res.body);
      final data = body['data'];
      final _lawyer = jsonEncode(data['lawyer']);
      _ref.read(lawyerProvider.notifier).update(
            (state) => Lawyer.fromJson(_lawyer),
          );
    } catch (e) {}
  }
}
