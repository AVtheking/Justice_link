// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:justice_link/common/api_service.dart';
import 'package:justice_link/common/snackbar.dart';
import 'package:justice_link/features/auth/services/auth_service.dart';
import 'package:justice_link/features/home_screen/screen/home_screen_lawyer.dart';
import 'package:justice_link/global.dart';
import 'package:justice_link/models/case.dart';
import 'package:shared_preferences/shared_preferences.dart';

final caseProvider = StateProvider<Case?>((ref) => null);
final caseServiceProvider = Provider((ref) => CaseService(ref: ref));

class CaseService {
  final Ref _ref;
  CaseService({required Ref ref}) : _ref = ref;

  Future<void> getCaseStatus({
    required BuildContext context,
    required String caseNo,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");

    try {
      http.Response res = await http.get(
          Uri.parse("$uri/lawyer/getCaseDetails/$caseNo"),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
            'authorization': "Bearer $token"
          });
      // print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          final body = jsonDecode(res.body);
          // print(body['data']);
          final data = body['data'];
          // print(data['user']);
          final _case = jsonEncode(data['caseDetails']);
          // print(_case);

          _ref.read(caseProvider.notifier).update(
                (state) => Case.fromJson(_case),
              );

          // print(_ref.read(caseProvider));
        },
      );
    } catch (e) {
      // print(e);
      showSnackBar(context, e.toString());
    }
  }
  Future<void> getCaseStatuslawyer({
    required BuildContext context,
    required String caseNo,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");

    try {
      http.Response res = await http.get(
          Uri.parse("$uri/getCaseDetails/$caseNo"),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
            'authorization': "Bearer $token"
          });
      // print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          final body = jsonDecode(res.body);
          // print(body['data']);
          final data = body['data'];
          // print(data['user']);
          final _case = jsonEncode(data['caseDetails']);
          // print(_case);

          _ref.read(caseProvider.notifier).update(
                (state) => Case.fromJson(_case),
              );

          // print(_ref.read(caseProvider));
        },
      );
    } catch (e) {
      // print(e);
      showSnackBar(context, e.toString());
    }
  }

  Future<void> uploadCaseDetails(
      {required BuildContext context,
      required String victimName,
      required String oppositionName,
      required String lastPresentedOn,
      required String petitioner,
      required String caseNo,
      required String respondent,
      required String petAdvocates,
      required String caseStatus,
      required String category,
      required String resAdvocates}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");
    try {
      final lawyer = _ref.read(lawyerProvider)!;
      Case caseDetails = Case(
          lawyerId: lawyer.id!,
          victimName: victimName,
          oppositionName: oppositionName,
          lastPresentedOn: lastPresentedOn,
          petitioner: petitioner,
          caseNo: caseNo,
          respondent: respondent,
          petAdvocates: petAdvocates,
          caseStatus: caseStatus,
          category: category,
          resAdvocates: resAdvocates);

      http.Response res = await http.post(
          Uri.parse("$uri/lawyer/uploadCaseStatus"),
          body: caseDetails.toJson(),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
            'authorization': "Bearer $token"
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            final body = jsonDecode(res.body);
            final data = body['data'];
            final _caseDetail = data['caseDetail'];
            // print(jsonEncode(_caseDetail));
            _ref
                .read(caseProvider.notifier)
                .update((state) => Case.fromJson(jsonEncode(_caseDetail)));
            showSnackBar(context, "Case Status uploaded successfully");
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: ((context) => const HomeScreenLawyer()),
                ),
                (route) => false);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> updateCaseStatus(
      {required BuildContext context,
      required String victimName,
      required String oppositionName,
      required String lastPresentedOn,
      required String petitioner,
      required String caseNo,
      required String respondent,
      required String petAdvocates,
      required String caseStatus,
      required String category,
      required String resAdvocates}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");
    try {
      final lawyer = _ref.read(lawyerProvider)!;
      Case caseDetails = Case(
          lawyerId: lawyer.id!,
          victimName: victimName,
          oppositionName: oppositionName,
          lastPresentedOn: lastPresentedOn,
          petitioner: petitioner,
          caseNo: caseNo,
          respondent: respondent,
          petAdvocates: petAdvocates,
          caseStatus: caseStatus,
          category: category,
          resAdvocates: resAdvocates);

      http.Response res = await http.put(
          Uri.parse("$uri/lawyer/updateCaseDetails"),
          body: caseDetails.toJson(),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
            'authorization': "Bearer $token"
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            final body = jsonDecode(res.body);
            final data = body['data'];
            final _caseDetail = data['caseDetail'];
            _ref
                .read(caseProvider.notifier)
                .update((state) => Case.fromJson(jsonEncode(_caseDetail)));
            showSnackBar(context, "Case Status uploaded successfully");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
