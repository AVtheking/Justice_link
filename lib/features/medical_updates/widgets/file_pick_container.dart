import 'package:flutter/material.dart';
import 'package:justice_link/features/medical_updates/widgets/file_pick_button.dart';
import 'package:justice_link/features/medical_updates/widgets/open_file.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilePickContainer extends StatefulWidget {
  final String title;

  const FilePickContainer({Key? key, required this.title}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FilePickContainerState createState() => _FilePickContainerState();
}

class _FilePickContainerState extends State<FilePickContainer> {
  late String pickedFilePath = '';
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
    return Container(
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
              _getTranslatedText(widget.title, "चिकित्सा रिपोर्टें"),
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                MyElevatedButton(
                  onFilePicked: (filePath) {
                    setState(() {
                      pickedFilePath = filePath;
                    });
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Text(
                    _getTranslatedText('+ Add File', '+ फ़ाइल जोड़ें'),
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF004D14), Color(0xFF098904)],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 34,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ViewFile(filePath: pickedFilePath),
                          ),
                        );
                      },
                      child: Text(
                        _getTranslatedText('View Files', 'फ़ाइलें देखें'),
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
