import 'package:flutter/material.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/common/snackbar.dart';
import 'package:justice_link/features/case_status/screens/case_status_lawyer.dart';
import 'package:justice_link/features/case_status/widgets/case_status_btn.dart';
import 'package:justice_link/features/case_status/widgets/rich_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewCaseStatus extends StatefulWidget {
  const NewCaseStatus({Key? key}) : super(key: key);

  @override
  State<NewCaseStatus> createState() => _CaseStatusState();
}

class _CaseStatusState extends State<NewCaseStatus> {
  final TextEditingController _caseNoController = TextEditingController();
  final _caseTypes = ["Criminal", "Civil"];
  String? _currentSelectedCaseType;
  String? _currentSelectedYear;
  late List<String> _years;
  bool _isYearDropdownOpen = false;
  String? _translation = "English";

  @override
  void dispose() {
    _caseNoController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _years = generateYearsList();
    _setLanguage();
  }

  List<String> generateYearsList() {
    List<String> years = [];
    int currentYear = DateTime.now().year;
    for (int i = currentYear; i >= currentYear - 10; i--) {
      years.add(i.toString());
    }
    return years;
  }

  Future<void> _setLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _translation = prefs.getString("language") ?? "English";
    });
  }

  String _getTranslatedText(String englishText, String hindiText) {
    return _translation == "Hindi" ? hindiText : englishText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfun(_getTranslatedText("Case Status", "मुकदमा स्थिति")),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    elevation: 5,
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Container(
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Case_status(
                                text: _getTranslatedText(
                                    "Case Number", "मुकदमा संख्या")),
                            const SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: TextField(
                                controller: _caseNoController,
                                cursorHeight: 20,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      "assets/images/par.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_caseNoController.text.trim().isEmpty ||
                          _currentSelectedCaseType == null ||
                          _currentSelectedYear == null) {
                        showSnackBar(context, "Please fill all the fields");
                        return;
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CaseStatusLawyer(
                            caseNo: _caseNoController.text.trim(),
                          ),
                        ),
                      );
                    },
                    child: CaseStatusButton(
                        text: _getTranslatedText(
                            "View Case Status", "मुकदमा स्थिति देखें")),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CaseStatusLawyer(),
                        ),
                      );
                    },
                    child: CaseStatusButton(
                        text: _getTranslatedText(
                            "Upload Case Status", "मुकदमा स्थिति अपलोड करें")),
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
