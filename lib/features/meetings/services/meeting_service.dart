// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:http/http.dart" as http;
import 'package:justice_link/common/api_service.dart';
import 'package:justice_link/common/connectivity.dart';
import 'package:justice_link/common/snackbar.dart';
import 'package:justice_link/features/auth/services/auth_service.dart';
import 'package:justice_link/features/home_screen/screen/home_screen.dart';
import 'package:justice_link/global.dart';
import 'package:justice_link/models/lawyer.dart';
import 'package:justice_link/models/meeting.dart';
import 'package:shared_preferences/shared_preferences.dart';

final meetingServiceProvider = Provider((ref) => MeetingService(ref: ref));
final meetingProvider = StateProvider<Meeting?>((ref) => null);

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
      // print(e);
      showSnackBar(context, e.toString());
    }
    return lawyers;
  }

  Future<void> sendMeetingReq({
    required BuildContext context,
    required String lawyerId,
    // required String senderName,
    required String receiverName,
    required String accusedName,
    required String applicantName,
    required String caseType,
    required String oppositionLawyerName,
    required String caseNo,
    required String courtName,
    required String caseDetails,
  }) async {
      final bool _isConnected =await ConnectivityService().isConnected();
      if(!_isConnected){
        showSnackBar(context, "No Internet Connection");
        return;
      }
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");
      final user = _ref.read(userProvider)!;
      http.Response res = await http.post(
        Uri.parse("$uri/meeting-request"),
        body: jsonEncode({
          "lawyerId": lawyerId,
          "userId": user.id,
          "senderName": user.name,
          "receiverName": receiverName,
          "accusedName": accusedName,
          "applicantName": applicantName,
          "caseType": caseType,
          "opposingLawyerName": oppositionLawyerName,
          "caseNo": caseNo,
          "courtName": courtName,
          "caseDetails": caseDetails,
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
            showSnackBar(context, "Meeting Request Sent Successfully");
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false);
          });
    } catch (e) {
      // print(e);
      showSnackBar(context, e.toString());
    }
  }

  Future<Meeting?> getMeetingRequests(
      BuildContext context, String lawyerId) async {
          final bool _isConnected =await ConnectivityService().isConnected();
      if(!_isConnected){
        showSnackBar(context, "No Internet Connection");
        return null;
      }
    Meeting? meeting;
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");
      // final user = _ref.read(userProvider)!;
      http.Response res = await http.get(
        Uri.parse("$uri/get-meeting-client/$lawyerId"),
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
            final meetingsData = data['meeting'];
            meeting = meetingsData != null
                ? Meeting.fromJson(
                    jsonEncode(meetingsData),
                  )
                : null;
            // print(meetingsData);

            meetingsData == null
                ? _ref.read(meetingProvider.notifier).update(
                      (state) => null,
                    )
                : _ref.read(meetingProvider.notifier).update(
                      (state) => Meeting.fromJson(
                        jsonEncode(meetingsData),
                      ),
                    );
          });
    } catch (e) {
      // print(e);
      showSnackBar(context, e.toString());
    }
    return meeting;
  }

  Future<List<Meeting>> getMeetingRequestsForLawyer(
      BuildContext context) async {

    List<Meeting> meetings = [];
      final bool _isConnected =await ConnectivityService().isConnected();
      if(!_isConnected){
        showSnackBar(context, "No Internet Connection");
        return meetings;
      }
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");
      http.Response res = await http
          .get(Uri.parse("$uri/get-meeting-lawyer"), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': "Bearer $token"
      });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            final body = jsonDecode(res.body);
            final data = body['data'];
            final meetingsData = data['meetings'];
            for (int i = 0; i < meetingsData.length; i++) {
              final String _meeting = jsonEncode(meetingsData[i]);
              // print(_meeting);
              meetings.add(Meeting.fromJson(_meeting));
            }
          });
    } catch (e) {
      // print(e);
      showSnackBar(context, e.toString());
    }
    return meetings;
  }

  Future<void> acceptMeetingRequest({
    required BuildContext context,
    required Meeting meeting,
  }) async {
      final bool _isConnected =await ConnectivityService().isConnected();
      if(!_isConnected){
        showSnackBar(context, "No Internet Connection");
        return;
      }
    try {
      // final meeting = _ref.read(meetingProvider)!;
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");
      http.Response res = await http.put(
        Uri.parse("$uri/accept-meeting-request/${meeting.id}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': "Bearer $token"
        },
      );
      // print(res);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            // final body = jsonDecode(res.body);
            // final data = body['data'];
            // final meetingData = data['meeting'];
            // _ref.read(provider)
            // print("Meeting accepted");
            showSnackBar(context, "Meeting Request Accepted Successfully");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> declineMeetingRequest({
    required BuildContext context,
    required Meeting meeting,
  }) async {
      final bool _isConnected =await ConnectivityService().isConnected();
      if(!_isConnected){
        showSnackBar(context, "No Internet Connection");
        return;
      }
    try {
      final meeting = _ref.read(meetingProvider)!;
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");
      http.Response res = await http.put(
        Uri.parse("$uri/decline-meeting-request/${meeting.id}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': "Bearer $token"
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            // final body = jsonDecode(res.body);
            // final data = body['data'];
            // final meetingData = data['meeting'];
            // _ref.read(provider)
            showSnackBar(context, "Meeting Request Declined Successfully");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
