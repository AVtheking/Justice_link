// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/features/case_status/widgets/case_details_lawyer.dart';
import 'package:justice_link/features/case_status/widgets/versus_card_lawyer.dart';

class CaseStatusLawyer extends StatefulWidget {
  const CaseStatusLawyer({super.key});

  @override
  State<CaseStatusLawyer> createState() => _CaseStatusLawyerState();
}

class _CaseStatusLawyerState extends State<CaseStatusLawyer> {
  TextEditingController _victimController = TextEditingController();
  final TextEditingController _oppositionController = TextEditingController();
  final TextEditingController _caseNoController = TextEditingController();
  final TextEditingController _lastPresentedOnController =
      TextEditingController();
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

  List<String> headings = [
    "Case No",
    "Last Presented On",
    "Case Status",
    "Category",
    "Petitioner(s)",
    "Respondent(s)",
    "Pet.Advocates",
    "Res.Advocates"
  ];

  @override
  Widget build(BuildContext context) {
    _victimController.text = "Mehul Sharma";
    return Scaffold(
      appBar: appbarfun("Case Status"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VersusCardLawyer(
                victimController: _victimController,
                oppositionController: _oppositionController),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Case Details:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            CaseDetailsLawyer(
                heading: "Case No",
                hintText: "Enter Case No",
                controller: _caseNoController),
            CaseDetailsLawyer(
                heading: "Last Presented On",
                hintText: "Enter Last Presented On date",
                controller: _lastPresentedOnController),
            CaseDetailsLawyer(
                heading: "Case Status",
                hintText: "Enter Case Status",
                controller: _caseNoController),
            CaseDetailsLawyer(
                heading: "Category",
                hintText: "Enter Category",
                controller: _categoryController),
            CaseDetailsLawyer(
                heading: "Petitioner(s)",
                hintText: "Enter petitioner(s)",
                controller: _petitionerController),
            CaseDetailsLawyer(
                heading: "Respondent(s)",
                hintText: "Enter Respondent(s)",
                controller: _respondentController),
            CaseDetailsLawyer(
                heading: "Pet.Advocates",
                hintText: "Enter Pet.Advocates",
                controller: _petAdvController),
            CaseDetailsLawyer(
                heading: "Res.Advocates",
                hintText: "Enter Res.Advocates",
                controller: _resAdvController),
            // const SizedBox(
            //   height: 5,
            // ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF046200),
                    Color(
                      0xFF098904,
                    ),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: const Center(
                  child: Text(
                "Update Case status",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              )),
            )
          ],
        ),
      ),
    );
  }
}
