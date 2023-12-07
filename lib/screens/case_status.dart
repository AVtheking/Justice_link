import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:justice_link/widgets/rich_text.dart';

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
      appBar: AppBar(
        title: const Text(
          "Case Status",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(255, 72, 73, 72),
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Color(0xFF046200)),
      ),
      body: Column(
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
                    Case_status(text: "Case Type"),
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
                    Case_status(text: "Case Number"),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: TextField(
                        cursorHeight: 20,
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
                    Case_status(text: "year"),
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
    );
  }
}
