import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/features/auth/screens/sign_up.dart';
import 'package:justice_link/features/auth/services/auth_service.dart';
import 'package:justice_link/features/auth/widgets/text_field.dart';
import 'package:justice_link/features/case_status/widgets/rich_text.dart';
import 'package:justice_link/features/utrc/widgets/InputContainer.dart';

class AnnexureA extends ConsumerStatefulWidget {
  const AnnexureA({super.key});

  @override
  ConsumerState<AnnexureA> createState() => _LoginState();
}

class _LoginState extends ConsumerState<AnnexureA> {
  TextEditingController _utpNameController = TextEditingController();
  TextEditingController _fatherNameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _firController = TextEditingController();
  TextEditingController _policeStationController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _arrestedUnderSectionController =
      TextEditingController();
  TextEditingController _courtParticularsController = TextEditingController();
  TextEditingController _dateOfArrestController = TextEditingController();
  TextEditingController _dateOfFirstRemandController = TextEditingController();
  TextEditingController _dateOfAdmissionController = TextEditingController();
  TextEditingController _dateOfFillingSheetController = TextEditingController();
  TextEditingController _chargesheetedUnderSectionController =
      TextEditingController();
  TextEditingController _utpRepresentedByController = TextEditingController();
  TextEditingController _lawyersDetailsController = TextEditingController();
  TextEditingController _bailStatusController = TextEditingController();
  TextEditingController _reasonForNoBailController = TextEditingController();
  TextEditingController _diseaseDetailsController = TextEditingController();
  TextEditingController _convictUndertrialController = TextEditingController();
  TextEditingController _additionalCaseDetailsController =
      TextEditingController();

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
              Container(
                height: 38,
                width: 340,
                child: CustomTextField(
                  controller: _utpNameController,
                  hintText: 'Name of the UTP',
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
                    controller: _genderController,
                    hintText: 'Gender',
                    width: 140,
                  ),
                  Spacer(),
                  CustomTextField(
                    controller: _ageController,
                    hintText: 'Age',
                    width: 140,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _firController,
                hintText: 'Fir / Crime No.',
                width: 340,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _policeStationController,
                hintText: 'Police Station',
                width: 340,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CustomTextField(
                    controller: _districtController,
                    hintText: 'District',
                    width: 140,
                  ),
                  Spacer(),
                  CustomTextField(
                    controller: _arrestedUnderSectionController,
                    hintText: 'Arrested under section',
                    width: 140,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _courtParticularsController,
                hintText: 'Particulars of the Court',
                width: 340,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CustomTextField(
                    controller: _dateOfArrestController,
                    hintText: 'Date of Arrest',
                    width: 140,
                  ),
                  Spacer(),
                  CustomTextField(
                    controller: _dateOfFirstRemandController,
                    hintText: 'Date of First remand',
                    width: 140,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CustomTextField(
                    controller: _dateOfAdmissionController,
                    hintText: 'Date of Admission',
                    width: 140,
                  ),
                  Spacer(),
                  CustomTextField(
                    controller: _dateOfFillingSheetController,
                    hintText: 'Date of Filling sheet',
                    width: 140,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _chargesheetedUnderSectionController,
                hintText: 'Chargesheeted under Section',
                width: 340,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _utpRepresentedByController,
                hintText: 'UTP represented by Legal aid/Private',
                width: 340,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _lawyersDetailsController,
                hintText:
                    'Name of the lawyers with contact details (if applicable)',
                width: 340,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _bailStatusController,
                hintText:
                    'Whether bails has been granted to the accused, if when',
                width: 340,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _reasonForNoBailController,
                hintText:
                    'If accused is not released on bail despite grant of bail, reason for the same (if applicable)',
                width: 340,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _diseaseDetailsController,
                hintText:
                    'If the UTP suffering from any disease, mental or physical, details regarding the same.',
                width: 340,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _convictUndertrialController,
                hintText: 'Whether UTP is a convict/Undertrial in any other',
                width: 340,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _additionalCaseDetailsController,
                hintText:
                    'If yes, separate entry in the datasheet be made qua the additional case',
                width: 340,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  // Handle onTap logic here
                  // print("here");
                  // login(context);
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
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Do not have an account? ",
                      style: TextStyle(fontSize: 16)),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Register(),
                        ),
                      );
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(color: Color(0xFF046200), fontSize: 16),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
