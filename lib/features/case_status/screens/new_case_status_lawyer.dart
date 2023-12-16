import 'package:flutter/material.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/features/case_status/screens/case_status_lawyer.dart';
import 'package:justice_link/features/case_status/screens/view_case_status.dart';
import 'package:justice_link/features/case_status/widgets/case_status_btn.dart';
import 'package:justice_link/features/case_status/widgets/rich_text.dart';

class NewCaseStatus extends StatefulWidget {
  const NewCaseStatus({Key? key}) : super(key: key);

  @override
  State<NewCaseStatus> createState() => _CaseStatusState();
}

class _CaseStatusState extends State<NewCaseStatus> {
  final _currencies = [
    "Criminal",
    "Civil",
  ];
  String? _currentSelectedValue;
  String? _currentSelectedYear;
  late List<String> _years;
  bool _isYearDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    _years = generateYearsList();
  }

  List<String> generateYearsList() {
    List<String> years = [];
    int currentYear = DateTime.now().year;
    for (int i = currentYear; i >= currentYear - 10; i--) {
      years.add(i.toString());
    }
    return years;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfun("Case Status"),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      elevation: 10,
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 40),
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 7,
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
                              const Case_status(text: "Case Type"),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black54),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      iconEnabledColor: Colors.black,
                                      value: _currentSelectedValue,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _currentSelectedValue = newValue;
                                        });
                                      },
                                      items: [
                                        ..._currencies.map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
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
                              const Case_status(text: "Case Number"),
                              const SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                child: TextField(
                                  cursorHeight: 20,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    // hintText: "Enter Case Number",
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
                    Card(
                      elevation: 10,
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 40),
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 7,
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
                              const Case_status(text: "year"),
                              const SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isYearDropdownOpen = !_isYearDropdownOpen;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black54),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Text(
                                        _currentSelectedYear ?? "Select Year",
                                      ),
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
                  height: 100,
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ViewCaseStatus(),
                          ),
                        );
                      },
                      child: const CaseStatusButton(text: "View Case Status"),
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
                      child: const CaseStatusButton(text: "Upload Case Status"),
                    ),
                    const SizedBox(
                      height: 40,
                    )
                  ],
                ),
                if (_isYearDropdownOpen)
                  Positioned(
                    top: 120, // Adjust the position based on your UI
                    left: 20,
                    right: 20,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 150,
                      // width: 300,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: ListView.builder(
                        itemCount: _years.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(_years[index]),
                            onTap: () {
                              setState(() {
                                _currentSelectedYear = _years[index];
                                _isYearDropdownOpen = false;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}