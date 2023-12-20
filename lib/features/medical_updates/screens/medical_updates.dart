import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:justice_link/features/medical_updates/widgets/file_pick_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicalUpdates extends StatefulWidget {
  const MedicalUpdates({Key? key}) : super(key: key);

  @override
  State<MedicalUpdates> createState() => _MedicalUpdatesState();
}

class _MedicalUpdatesState extends State<MedicalUpdates> {
  String? _translation = "English";

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
      appBar: AppBar(
        actions: const [],
        title: Text(_getTranslatedText("Medical Updates", "चिकित्सा अपडेट")),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(255, 72, 73, 72),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFF046200),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 329,
              height: 81,
              margin: const EdgeInsets.only(top: 30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(9, 0, 0, 0),
                    child: Image.asset(
                      'assets/images/Group.png',
                      width: 60,
                      height: 60,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getTranslatedText("Manoj Kumar", "मनोज कुमार"),
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.0,
                            color: Color(0xFF046200),
                          ),
                        ),
                        Text(_getTranslatedText(
                            "Ward No . : 420", "वार्ड नंबर: 420")),
                        Text(_getTranslatedText(
                            "Appointed Doctor : Dr. KK Menon",
                            "नियुक्त डॉक्टर: डॉ. के.के. मेनन"))
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 49,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(9, 3, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  FilePickContainer(
                    title: _getTranslatedText(
                        "Medical Reports", "चिकित्सा रिपोर्टें"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 49,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(9, 3, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  FilePickContainer(
                    title: _getTranslatedText(
                        "Prescription Medication", "निर्धारित औषधि"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 49,
            ),
            Container(
              width: 329,
              height: 77,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(9, 3, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getTranslatedText(
                          "Next Scheduled on:", "अगला निर्धारित है:"),
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                        _getTranslatedText(
                            "Date: 12/12/2021", "तारीख: 12/12/2021"),
                        style: const TextStyle(fontWeight: FontWeight.w500)),
                    Text(
                        _getTranslatedText("Doctor Appointed: Rajesh Yadav",
                            "नियुक्त डॉक्टर: राजेश यादव"),
                        style: const TextStyle(fontWeight: FontWeight.w500))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
