import 'package:flutter/material.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/features/document_verification/widgets/required_documents_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DocumentVerification extends StatefulWidget {
  const DocumentVerification({Key? key}) : super(key: key);

  @override
  State<DocumentVerification> createState() => _DocumentVerificationState();
}

class _DocumentVerificationState extends State<DocumentVerification> {
   String? _translation="English";

  @override
  void initState() {
    super.initState();
    _setLanguage();
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
      appBar: appbarfun(_getTranslatedText("Document Verification", "दस्तावेज सत्यापन")),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RequiredDocuments(
                    title: _getTranslatedText("Government Issued-ID", "सरकार द्वारा जारी किया गया आईडी"),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  RequiredDocuments(
                    title: _getTranslatedText("Aadhar Card", "आधार कार्ड"),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  RequiredDocuments(
                    title: _getTranslatedText("Address Proof", "पता साबित करने का सबूत"),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  RequiredDocuments(
                    title: _getTranslatedText("Legal Documents", "कानूनी दस्तावेज़"),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  RequiredDocuments(
                    title: _getTranslatedText("Passport Size Photograph", "पासपोर्ट साइज़ फ़ोटोग्राफ"),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Image.asset(
            'assets/images/par.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 131,
          ),
        ],
      ),
    );
  }
}
