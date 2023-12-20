// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/features/auth/screens/sign_up.dart';
import 'package:justice_link/features/auth/services/auth_service.dart';
import 'package:justice_link/features/home_screen/screen/home_screen.dart';
import 'package:justice_link/features/home_screen/screen/home_screen_lawyer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStartedScreen extends ConsumerStatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends ConsumerState<GetStartedScreen> {
  final List<String> items = <String>[
    "English",
    "Hindi",
    "Bengali",
    "Gujarati",
    "Tamil",
    "Punjabi",
  ];

  List<bool> isCheckedList = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    final lawyer = ref.read(lawyerProvider);
    final user = ref.read(userProvider);
    return Scaffold(
      appBar: AppBar(
        actions: const [],
        title: const Text("Choose Your Language"),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(255, 72, 73, 72),
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Color(0xFF046200)),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.asset('assets/images/translate.png'),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Please choose your preferred language',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                height: 1.25,
                letterSpacing: 0.0,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
              height: 250,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: const RadialGradient(
                  center: Alignment.center,
                  // radius: 1.0,
                  colors: [
                    Color(0xFF098904),
                    Color(0xFF004D14),
                  ],
                ),
              ),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 320 / 160,
                children: [
                  for (int i = 0; i < items.length; i++)
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      width: 134,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            for (int j = 0; j < isCheckedList.length; j++) {
                              isCheckedList[j] = false; // Reset all checkboxes
                            }
                            isCheckedList[i] =
                                true; // Set the current checkbox to true
                          });
                        },
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 26,
                              height: 26,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isCheckedList[i]
                                    ? const Color(0xFF004D14)
                                    : const Color(0xFFEEEEEE),
                              ),
                              child: isCheckedList[i]
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 15,
                                    )
                                  : null,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              items[i],
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                height: 1.25,
                                letterSpacing: 0.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/images/par.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 131,
            ),
            Container(
              width: 320,
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFF046200),
                    Color.fromRGBO(4, 98, 0, 0.8),
                  ],
                ),
              ),
              child: TextButton(
                onPressed: () async {
                  if (isCheckedList[1] == true) {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    await pref.setString("language", "Hindi");
                    // print("hindi");
                  } else if (isCheckedList[0]) {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    await pref.setString("language", "English");
                    // print("English");

                    // translation = "English";
                  } else if (isCheckedList[2]) {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    await pref.setString("language", "Bengali");
                  } else if (isCheckedList[3]) {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    await pref.setString("language", "Gujarati");
                  } else if (isCheckedList[4]) {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    await pref.setString("language", "Tamil");
                  } else if (isCheckedList[5]) {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    await pref.setString("language", "Punjabi");
                  }
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => lawyer == null
                          ? user == null
                              ? const Register()
                              : const HomeScreen()
                          : const HomeScreenLawyer(),
                    ),
                    (route) => false,
                  );
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
