import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CaseStatus extends StatefulWidget {
  const CaseStatus({Key? key}) : super(key: key);

  @override
  State<CaseStatus> createState() => _CaseStatusState();
}

class _CaseStatusState extends State<CaseStatus> {
  var _currencies = [
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary"
  ];
  String? _currentSelectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Case Status"),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.white,
        shadowColor: Color.fromARGB(255, 72, 73, 72),
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Color(0xFF046200)),
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
                    const Text(
                      "Case Type",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 30,
                      child: InputDecorator(
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(
                            color: Colors.redAccent,
                            fontSize: 13.0,
                          ),
                          // hintText: 'Please select expense',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // isEmpty: _currentSelectedValue == null,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _currentSelectedValue,
                            isDense: true,
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                _currentSelectedValue = newValue;
                              });
                            },
                            items: [
                              // const DropdownMenuItem<String>(
                              //   // value: null,
                              //   child: Text(''), // Empty item
                              // ),
                              ..._currencies.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }),
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
                    const Text(
                      "Case Number",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          // hintText: "Enter Case Number",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    )
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
