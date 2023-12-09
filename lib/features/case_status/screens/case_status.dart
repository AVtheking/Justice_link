import 'package:flutter/material.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/features/case_status/screens/view_case_status.dart';
import 'package:justice_link/features/case_status/widgets/rich_text.dart';

class CaseStatus extends StatefulWidget {
  const CaseStatus({Key? key}) : super(key: key);

  @override
  State<CaseStatus> createState() => _CaseStatusState();
}

class _CaseStatusState extends State<CaseStatus> {
  final _currencies = [
    "Food",
    "Transport",
    "Personal",
  ];
  String? _currentSelectedValue;
  String? _currentSelectedYear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfun("Case Status"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  elevation: 10,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
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
                          // const Text(
                          //   "Case Type",
                          //   style:
                          //       TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          // ),
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
                          const Case_status(text: "Case Number"),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: TextField(
                              // cursorHeight: 20,
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
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
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
                                  value: _currentSelectedYear,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _currentSelectedYear = newValue;
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
              ],
            ),
            const SizedBox(
              height: 150,
            ),
            Column(
              children: [
                SizedBox(
                  // margin: const EdgeInsets.only(bottom: 50),
                  // height: 131,
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
                  child: Container(
                    height: 46,
                    margin: const EdgeInsets.symmetric(horizontal: 19),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF046200), Color(0xFF098904)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.remove_red_eye, color: Colors.white),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "View Case Status",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
