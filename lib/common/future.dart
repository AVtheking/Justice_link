import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/translator/translator_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TranslateText extends ConsumerStatefulWidget {
  const TranslateText({
    super.key,
    required this.englishText,
    required this.style,
    this.textAlign = false,
  });
  final String englishText;
  final TextStyle style;
  final bool textAlign;

  @override
  ConsumerState<TranslateText> createState() => _FutureScreenState();
}

class _FutureScreenState extends ConsumerState<TranslateText> {
  Future<String> translatedText(String text, String translation) async {
    return await ref
        .read(translatorProvider)
        .translate(textString: text, context: context, lang: translation);
  }

  String? translation = "English";
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

  @override
  Widget build(BuildContext context) {
    // final user = ref.read(userProvider);
    return translation == "English"
        ? Text(
            widget.englishText,
            style: widget.style,
            textAlign: widget.textAlign ? TextAlign.center : null,
          )
        : FutureBuilder<String>(
            future: translatedText(widget.englishText, translation!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Placeholder for loading state
                return Container(
                  width: 100, // Adjust width as needed
                  height: 20, // Adjust height as needed
                  alignment: Alignment.center,
                  child: const Text(
                    "Loading...", // You can customize this text
                    style: TextStyle(
                        color: Colors.grey, // Adjust color as needed
                        fontSize: 12,
                        overflow:
                            TextOverflow.ellipsis // Adjust font size as needed
                        ),
                  ),
                );
              } else if (snapshot.hasError) {
                // print(snapshot.error);
                return Text('Error: ${snapshot.error}');
              } else {
                return Text(
                  "${snapshot.data}",
                  style: widget.style,
                  textAlign: widget.textAlign ? TextAlign.center : null,
                );
              }
            },
          );
  }
}
