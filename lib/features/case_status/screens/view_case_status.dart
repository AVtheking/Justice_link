import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/features/case_status/widgets/case_details.dart';
import 'package:justice_link/features/case_status/widgets/case_status.dart';
import 'package:justice_link/features/case_status/widgets/versus_card.dart';

class ViewCaseStatus extends ConsumerWidget {
  const ViewCaseStatus({Key? key, required this.translation}) : super(key: key);
  final String translation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // _setLanguage();

    List<String> headings = [
      _getTranslatedText("Case No", "मुकदमा संख्या"),
      _getTranslatedText("Last Presented On", "अंतिम प्रस्तुत किया गया"),
      _getTranslatedText("Case Status", "मुकदमा स्थिति"),
      _getTranslatedText("Category", "श्रेणी"),
      _getTranslatedText("Petitioner(s)", "याचिककर्ता(ए)"),
      _getTranslatedText("Respondent(s)", "उत्तरदाता(ए)"),
      _getTranslatedText("Pet.Advocates", "प्रतिवादी वकील(ए)"),
      _getTranslatedText("Res.Advocates", "उत्तरदाता के वकील(ए)"),
    ];


    List<String> details = [
      _getTranslatedText("1000/2023 Registered On 06-12-2023 12:11 AM",
          "1000/2023 पंजीकृत हुआ 06-12-2023 12:11 बजे रात"),
      _getTranslatedText("15-12-2023", "15-12-2023"),
      _getTranslatedText(
          "WON \nJUDGES: HONBLE MR. JUSTICE MEHUL SHARMA HONBLE MR.JUSTICE PRAKHAR GARG",
          "जीता \nन्यायाधीश: आदरणीय श्री मेहुल शर्मा और आदरणीय श्री प्रखर गर्ग"),
      _getTranslatedText(
          "CRIMINAL UNDER SECTION 305", "धारा 305 के तहत जुर्माना"),
      _getTranslatedText("MR. RAKESH AGGARWAL\nADDRESS: CHIRANJEEV VIHAR",
          "श्री राकेश अग्रवाल\nपता: चिरंजीव विहार"),
    ];


    return Scaffold(
      appBar: appbarfun(_getTranslatedText("Case Status", "मुकदमा स्थिति")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VersusCard(),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                _getTranslatedText("Case Details", "मुकदमा विवरण:"),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const CaseResult(),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: headings.length,
              itemBuilder: (ctx, ind) {
                return CaseDetails(
                  heading: headings[ind],
                  details: ind > details.length - 1 ? "" : details[ind],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> _setLanguage() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _translation = prefs.getString("language") ?? "English";
  // }

  String _getTranslatedText(String englishText, String hindiText) {
    return translation == "Hindi" ? hindiText : englishText;
  }
}
