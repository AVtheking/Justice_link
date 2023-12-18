import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/features/case_status/widgets/rich_text.dart';
import 'package:justice_link/features/home_screen/screen/home_screen.dart';
import 'package:justice_link/features/utrc/widgets/InputContainer.dart';

class AnnexureA1 extends ConsumerStatefulWidget {
  const AnnexureA1({super.key});

  @override
  ConsumerState<AnnexureA1> createState() => _LoginState();
}

class _LoginState extends ConsumerState<AnnexureA1> {
  final TextEditingController _recommdationUTRC = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _dateOfRecommandation = TextEditingController();
  final TextEditingController _dateOfRelease = TextEditingController();
  final TextEditingController _briefReasonsForUtrcRecomm =
      TextEditingController();
  final TextEditingController _actionTakenOnRecomm = TextEditingController();

  final TextEditingController _finalOutcome = TextEditingController();

  bool _areTextControllersNotEmpty() {
    return _recommdationUTRC.text.isNotEmpty &&
        _fatherNameController.text.isNotEmpty &&
        _dateOfRecommandation.text.isNotEmpty &&
        _dateOfRelease.text.isNotEmpty &&
        _briefReasonsForUtrcRecomm.text.isNotEmpty &&
        _actionTakenOnRecomm.text.isNotEmpty &&
        _finalOutcome.text.isNotEmpty;
  }

  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfun('UTRC Connection'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: selectedOption == 1
                              ? const LinearGradient(
                                  colors: [
                                    Color(0xFF004D14),
                                    Color(0xFF098904)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                )
                              : null,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              spreadRadius: 1,
                            ),
                          ],
                          color: selectedOption == 1 ? null : Colors.white,
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Radio(
                                value: 1,
                                groupValue: selectedOption,
                                fillColor: selectedOption == 1
                                    ? MaterialStateProperty.all(Colors.white)
                                    : MaterialStateProperty.all(
                                        const Color(0xFF004D14),
                                      ),
                                onChanged: (value) {
                                  setState(() {
                                    selectedOption = value as int;
                                  });
                                },
                              ),
                              Text(
                                "Annexure A",
                                style: TextStyle(
                                  color: selectedOption == 1
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 1,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: selectedOption == 2
                              ? const LinearGradient(
                                  colors: [
                                    Color(0xFF004D14),
                                    Color(0xFF098904)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                )
                              : null,
                          color: selectedOption == 2 ? null : Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Row(children: [
                              Radio(
                                fillColor: selectedOption == 2
                                    ? MaterialStateProperty.all(Colors.white)
                                    : const MaterialStatePropertyAll(
                                        Color(0xFF004D14),
                                      ),
                                value: 2,
                                groupValue: selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOption = value as int;
                                  });
                                },
                              ),
                              Text(
                                "Annexure B",
                                style: TextStyle(
                                  color: selectedOption == 2
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Case_status(text: 'To be filled by Jail Superintendent'),
              const SizedBox(height: 20),
              SizedBox(
                height: 38,
                width: 340,
                child: CustomTextField(
                  controller: _recommdationUTRC,
                  hintText: 'Recommendation of UTRC',
                  width: 340,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                controller: _fatherNameController,
                hintText: 'Father’s Name',
                width: 340,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CustomTextField(
                    controller: _dateOfRecommandation,
                    hintText: 'Date of recommendation',
                    width: 140,
                  ),
                  const Spacer(),
                  CustomTextField(
                    controller: _dateOfRelease,
                    hintText: 'Date of release of UTP',
                    width: 140,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _briefReasonsForUtrcRecomm,
                hintText: 'Brief reasons for UTRC recommendation',
                width: 340,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _actionTakenOnRecomm,
                hintText: 'Action taken on recommendation',
                width: 340,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _finalOutcome,
                hintText: 'Final Outcome',
                width: 340,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                  onTap: () {
                    if (_areTextControllersNotEmpty()) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill in all the fields'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF004D14),
                          Color(0xFF098904),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
