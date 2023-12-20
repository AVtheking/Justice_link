// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/features/case_status/services/case_services.dart';
import 'package:justice_link/features/case_status/widgets/case_details_lawyer.dart';
import 'package:justice_link/features/case_status/widgets/versus_card_lawyer.dart';

class CaseStatusLawyer extends ConsumerStatefulWidget {
  const CaseStatusLawyer({Key? key, this.caseNo}) : super(key: key);
  final String? caseNo;

  @override
  ConsumerState<CaseStatusLawyer> createState() => _CaseStatusLawyerState();
}

class _CaseStatusLawyerState extends ConsumerState<CaseStatusLawyer> {
   String? _translation="English";

  final TextEditingController _victimController = TextEditingController();
  final TextEditingController _oppositionController = TextEditingController();
  final TextEditingController _caseNoController = TextEditingController();
  final TextEditingController _lastPresentedOnController = TextEditingController();
  final TextEditingController _caseStatusController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _petitionerController = TextEditingController();
  final TextEditingController _respondentController = TextEditingController();
  final TextEditingController _petAdvController = TextEditingController();
  final TextEditingController _resAdvController = TextEditingController();

  @override
  void dispose() {
    _victimController.dispose();
    _oppositionController.dispose();
    _caseNoController.dispose();
    _lastPresentedOnController.dispose();
    _caseStatusController.dispose();
    _categoryController.dispose();
    _petitionerController.dispose();
    _respondentController.dispose();
    _petAdvController.dispose();
    _resAdvController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _setLanguage();
    _getCaseDetails();
    super.initState();
  }

  void _setLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _translation = prefs.getString("language") ?? "English";
    });
  }

  void _getCaseDetails() async {
    if (widget.caseNo != null) {
      await ref.read(caseServiceProvider).getCaseStatuslawyer(context: context, caseNo: widget.caseNo!);

      final caseDetails = ref.read(caseProvider);

      _victimController.text = _getTranslatedText(caseDetails?.victimName, 'Right to Legal Representation:');
      _caseNoController.text = _getTranslatedText(caseDetails?.caseNo, 'Case No:');
      _caseStatusController.text = _getTranslatedText(caseDetails?.caseStatus, 'Case Status:');
      _categoryController.text = _getTranslatedText(caseDetails?.category, 'Category:');
      _lastPresentedOnController.text = _getTranslatedText(caseDetails?.lastPresentedOn, 'Last Presented On:');
      _oppositionController.text = _getTranslatedText(caseDetails?.oppositionName, 'Opposition Name:');
      _petAdvController.text = _getTranslatedText(caseDetails?.petAdvocates, 'Petitioner\'s Advocate:');
      _petitionerController.text = _getTranslatedText(caseDetails?.petitioner, 'Petitioner:');
      _resAdvController.text = _getTranslatedText(caseDetails?.resAdvocates, 'Respondent\'s Advocate:');
      _respondentController.text = _getTranslatedText(caseDetails?.respondent, 'Respondent:');
    }
  }

  String _getTranslatedText(String? englishText, String heading) {
    return _translation == "Hindi" ? heading : englishText ?? '';
  }

  void _uploadCaseDetails(BuildContext context) async {
    await ref.read(caseServiceProvider).uploadCaseDetails(
      context: context,
      victimName: _victimController.text.trim(),
      oppositionName: _oppositionController.text.trim(),
      lastPresentedOn: _lastPresentedOnController.text.trim(),
      petitioner: _petitionerController.text.trim(),
      caseNo: _caseNoController.text.trim(),
      respondent: _respondentController.text.trim(),
      petAdvocates: _petAdvController.text.trim(),
      caseStatus: _caseStatusController.text.trim(),
      category: _categoryController.text.trim(),
      resAdvocates: _resAdvController.text.trim(),
    );
  }

  void _updateCaseDetails(BuildContext context) async {
    await ref.read(caseServiceProvider).updateCaseStatus(
      context: context,
      victimName: _victimController.text.trim(),
      oppositionName: _oppositionController.text.trim(),
      lastPresentedOn: _lastPresentedOnController.text.trim(),
      petitioner: _petitionerController.text.trim(),
      caseNo: _caseNoController.text.trim(),
      respondent: _respondentController.text.trim(),
      petAdvocates: _petAdvController.text.trim(),
      caseStatus: _caseStatusController.text.trim(),
      category: _categoryController.text.trim(),
      resAdvocates: _resAdvController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final caseDetails = ref.read(caseProvider);
    return Scaffold(
      appBar: appbarfun(_getTranslatedText("Case Status", "मुकदमा स्थिति")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VersusCardLawyer(
              victimController: _victimController,
              oppositionController: _oppositionController,
            ),
             Padding(
              padding:const  EdgeInsets.only(left: 16),
              child: Text(
                _getTranslatedText("Case Details", "मुकदमे का विवरण:"),
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            CaseDetailsLawyer(
              heading: _getTranslatedText("Case No", "मुकदमा संख्या"),
              hintText: _getTranslatedText("Enter Case No", "मुकदमा संख्या दर्ज करें"),
              controller: _caseNoController,
            ),
            CaseDetailsLawyer(
              heading: _getTranslatedText("Last Presented On", "आखिरी प्रस्तुत किया गया:"),
              hintText: _getTranslatedText("Enter Last Presented On date", "तारीख दर्ज करें"),
              controller: _lastPresentedOnController,
            ),
            CaseDetailsLawyer(
              heading: _getTranslatedText("Case Status", "मुकदमा स्थिति"),
              hintText: _getTranslatedText("Enter Case Status", "मुकदमा स्थिति दर्ज करें"),
              controller: _caseStatusController,
            ),
            CaseDetailsLawyer(
              heading: _getTranslatedText("Category", "श्रेणी"),
              hintText: _getTranslatedText("Enter Category", "श्रेणी दर्ज करें"),
              controller: _categoryController,
            ),
            CaseDetailsLawyer(
              heading: _getTranslatedText("Petitioner(s)", "प्रार्थी(ओं)"),
              hintText: _getTranslatedText("Enter petitioner(s)", "प्रार्थी(ओं) दर्ज करें"),
              controller: _petitionerController,
            ),
            CaseDetailsLawyer(
              heading: _getTranslatedText("Respondent(s)", "उत्तराधिकारी(ओं)"),
              hintText: _getTranslatedText("Enter Respondent(s)", "उत्तराधिकारी(ओं) दर्ज करें"),
              controller: _respondentController,
            ),
            CaseDetailsLawyer(
              heading: _getTranslatedText("Pet.Advocates", "प्रार्थी के प्रतिनिधि वकील"),
              hintText: _getTranslatedText("Enter Pet.Advocates", "प्रार्थी के प्रतिनिधि वकील दर्ज करें"),
              controller: _petAdvController,
            ),
            CaseDetailsLawyer(
              heading: _getTranslatedText("Res.Advocates", "उत्तराधिकारी के प्रतिनिधि वकील"),
              hintText: _getTranslatedText("Enter Res.Advocates", "उत्तराधिकारी के प्रतिनिधि वकील दर्ज करें"),
              controller: _resAdvController,
            ),
            GestureDetector(
              onTap: () {
                caseDetails != null ? _updateCaseDetails(context) : _uploadCaseDetails(context);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF046200),
                      Color(0xFF098904),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Text(
                    caseDetails != null ? _getTranslatedText("Update Case status", "मुकदमे की स्थिति अपडेट करें") : _getTranslatedText("Upload Case Status", "मुकदमे की स्थिति अपलोड करें"),
                    style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
