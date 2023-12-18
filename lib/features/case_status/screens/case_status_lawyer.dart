import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/features/case_status/services/case_services.dart';
import 'package:justice_link/features/case_status/widgets/case_details_lawyer.dart';
import 'package:justice_link/features/case_status/widgets/versus_card_lawyer.dart';

class CaseStatusLawyer extends ConsumerStatefulWidget {
  const CaseStatusLawyer({super.key, this.caseNo});
  final String? caseNo;

  @override
  ConsumerState<CaseStatusLawyer> createState() => _CaseStatusLawyerState();
}

class _CaseStatusLawyerState extends ConsumerState<CaseStatusLawyer> {
  final TextEditingController _victimController = TextEditingController();
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

  @override
  void initState() {
    getCaseDetails();
    super.initState();
  }

  void getCaseDetails() async {
    if (widget.caseNo != null) {
      await ref
          .read(caseServiceProvider)
          .getCaseStatus(context: context, caseNo: widget.caseNo!);

      final caseDetails = ref.read(caseProvider);
      // if (caseDetails != null) print(caseDetails);
      {
        _victimController.text = caseDetails!.victimName;
        _caseNoController.text = caseDetails.caseNo;
        _caseStatusController.text = caseDetails.caseStatus;
        _categoryController.text = caseDetails.category;
        _lastPresentedOnController.text = caseDetails.lastPresentedOn;
        _oppositionController.text = caseDetails.oppositionName;
        _petAdvController.text = caseDetails.petAdvocates;
        _petitionerController.text = caseDetails.petitioner;
        _resAdvController.text = caseDetails.resAdvocates;
        _respondentController.text = caseDetails.respondent;
      }
    }
  }

  void uploadCaseDetails(BuildContext context) async {
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
        resAdvocates: _resAdvController.text.trim());
  }

  void updateCaseDetails(BuildContext context) async {
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
        resAdvocates: _resAdvController.text.trim());
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
    final caseDetails = ref.read(caseProvider);
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
                controller: _caseStatusController),
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
            GestureDetector(
              onTap: () {
                caseDetails != null
                    ? updateCaseDetails(context)
                    : uploadCaseDetails(context);
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                child: Center(
                    child: Text(
                  caseDetails != null
                      ? "Update Case status"
                      : "Upload Case Status",
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
