import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late String translation;

  @override
  void initState() {
    setLanguage();
    super.initState();
  }

  void setLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      translation = prefs.getString("language") ?? "English";
    });
  }

  String getTranslatedText(String englishText, String hindiText) {
    return translation == "Hindi" ? hindiText : englishText;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bulletPointRow(
                  getTranslatedText(
                    'Right to Legal Representation:',
                    'विधिक प्रतिनिधि का अधिकार:'
                  ),
                  getTranslatedText(
                    'Every individual has the right to legal representation during legal proceedings.\nYou are entitled to hire a lawyer or, if unable to afford one, you may request legal aid.',
                    'प्रत्येक व्यक्ति को कानूनी प्रक्रिया के दौरान विधिक प्रतिनिधि का अधिकार है।\nआपको एक वकील को रखने का अधिकार है या, यदि आप एक को वहन करने में असमर्थ हैं, तो आप कानूनी सहायता की अनुरोध कर सकते हैं।'
                  ),
                ),
                _divider(),
                _bulletPointRow(
                  getTranslatedText(
                    'Presumption of Innocence',
                    'निर्दोष की पूर्वानुमान'
                  ),
                  getTranslatedText(
                    'Everyone is presumed innocent until proven guilty in a court of law.\nThe burden of proof rests on the prosecution.',
                    'हर किसी को न्यायालय में दोषित साबित होने तक निर्दोष माना जाता है।\nसाबित करने का बोझ अभियोजन पर होता है।'
                  ),
                ),
                _divider(),
                // Add similar calls for other text blocks
                // ...
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bulletPointRow(String heading, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/images/bullet.png'),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(content),
            ],
          ),
        ),
      ],
    );
  }

  Widget _divider() {
    return Divider(
      color: Color(0xFFCCCCCC),
      height: 20,
      thickness: 0.5,
    );
  }
}
