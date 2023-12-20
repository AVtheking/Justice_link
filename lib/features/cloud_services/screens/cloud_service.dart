import 'package:flutter/material.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/features/case_status/screens/view_case_status.dart';
import 'package:justice_link/features/cloud_services/widgets/case_details_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CloudServices extends StatefulWidget {
  const CloudServices({super.key});

  @override
  State<CloudServices> createState() => _CloudServicesState();
}

class _CloudServicesState extends State<CloudServices> {
  String? translation = "Engilsh";
  @override
  void initState() {
    _setLanguage();
    super.initState();
  }

  Future<void> _setLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      translation = prefs.getString("language") ?? "English";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfun("Cloud Services"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 25),
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                    hintText: "Search Case No",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFF046200)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Recents Documents",
                  style: TextStyle(
                      color: Color(0xFF046200),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  // margin:
                  // const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    width: double.infinity,
                    // height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // const SizedBox(
                        //   width: 10,
                        // ),
                        Column(
                          children: [
                            Image.asset("assets/images/pdf.png"),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text("Medical\nReport",
                                style: TextStyle(fontSize: 12))
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset("assets/images/pdf.png"),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text("Adhar\nCard",
                                style: TextStyle(fontSize: 12))
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset("assets/images/pdf.png"),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              "Prescription\nMedication",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Case history",
                      style: TextStyle(
                          color: Color(0xFF046200),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    // const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "View All",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CaseDetailText(
                            heading: "Accused Name : ", detail: "Mehul sharma"),
                        CaseDetailText(
                            heading: "Case No. : ",
                            detail:
                                " 1000/2023 Registered On 06-12-2023 12:11 AM"),
                        CaseDetailText(
                            heading: "Case Type :  ", detail: "Civil Case"),
                        CaseDetailText(
                            heading: "Court Name : ",
                            detail: "Kavi Nagar District Court,Ghaziabad"),
                        CaseDetailText(
                            heading: "Last Presented On :",
                            detail: "12-9-2023"),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          ViewCaseStatus(translation: translation!),
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
                      Icon(
                        Icons.calendar_month_sharp,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Schedule Meeting",
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
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  "assets/images/par.png",
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
