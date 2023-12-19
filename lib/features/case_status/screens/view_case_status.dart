import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/features/case_status/widgets/case_details.dart';
import 'package:justice_link/features/case_status/widgets/case_status.dart';
import 'package:justice_link/features/case_status/widgets/versus_card.dart';

class ViewCaseStatus extends ConsumerWidget {
  const ViewCaseStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final caseDetails = ref.read(caseProvider)!;
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
    List<String> details = [
      "1000/2023 Registered On 06-12-2023 12:11 AM",
      "15-12-2023",
      "WON \nJUDGES: HONBLE MR. JUSTICE MEHUL SHARMA HONBLE MR.JUSTICE PRAKHAR GARG",
      "CRIMINAL UNDER SECTION 305",
      "MR. RAKESH AGGARWAL\nADDRESS: CHIRANJEEV VIHAR",
    ];
    return Scaffold(
      appBar: appbarfun("Case Status"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VersusCard(),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Case Details:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const CaseResult(),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: headings.length,
                itemBuilder: (ctx, ind) {
                  // var detail = details[ind];
                  return CaseDetails(
                      heading: headings[ind],
                      details: ind > details.length - 1 ? "" : details[ind]);
                })
          ],
        ),
      ),
    );
  }
}
