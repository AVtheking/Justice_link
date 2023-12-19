import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/features/case_status/widgets/rich_text.dart';
import 'package:justice_link/features/utrc/screens/annexurea1.dart';
import 'package:justice_link/features/utrc/screens/annexureb.dart';
import 'package:justice_link/features/utrc/widgets/InputContainer.dart';

class AnnexureA extends ConsumerStatefulWidget {
  const AnnexureA({super.key});

  @override
  ConsumerState<AnnexureA> createState() => _AnnexureA();
}

class _AnnexureA extends ConsumerState<AnnexureA> {
  final TextEditingController _utpNameController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _firController = TextEditingController();
  final TextEditingController _policeStationController =
      TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _arrestedUnderSectionController =
      TextEditingController();
  final TextEditingController _courtParticularsController =
      TextEditingController();
  final TextEditingController _dateOfArrestController = TextEditingController();
  final TextEditingController _dateOfFirstRemandController =
      TextEditingController();
  final TextEditingController _dateOfAdmissionController =
      TextEditingController();
  final TextEditingController _dateOfFillingSheetController =
      TextEditingController();
  final TextEditingController _chargesheetedUnderSectionController =
      TextEditingController();
  final TextEditingController _utpRepresentedByController =
      TextEditingController();
  final TextEditingController _lawyersDetailsController =
      TextEditingController();
  final TextEditingController _bailStatusController = TextEditingController();
  final TextEditingController _reasonForNoBailController =
      TextEditingController();
  final TextEditingController _diseaseDetailsController =
      TextEditingController();
  final TextEditingController _convictUndertrialController =
      TextEditingController();
  final TextEditingController _additionalCaseDetailsController =
      TextEditingController();

  int selectedOption = 1;
  bool _areTextControllersNotEmpty() {
    return _utpNameController.text.isNotEmpty &&
        _fatherNameController.text.isNotEmpty &&
        _genderController.text.isNotEmpty &&
        _ageController.text.isNotEmpty &&
        _firController.text.isNotEmpty &&
        _policeStationController.text.isNotEmpty &&
        _districtController.text.isNotEmpty &&
        _arrestedUnderSectionController.text.isNotEmpty &&
        _courtParticularsController.text.isNotEmpty &&
        _dateOfArrestController.text.isNotEmpty &&
        _dateOfFirstRemandController.text.isNotEmpty &&
        _dateOfAdmissionController.text.isNotEmpty &&
        _dateOfFillingSheetController.text.isNotEmpty &&
        _chargesheetedUnderSectionController.text.isNotEmpty &&
        _utpRepresentedByController.text.isNotEmpty &&
        _lawyersDetailsController.text.isNotEmpty &&
        _bailStatusController.text.isNotEmpty &&
        _reasonForNoBailController.text.isNotEmpty &&
        _diseaseDetailsController.text.isNotEmpty &&
        _convictUndertrialController.text.isNotEmpty &&
        _additionalCaseDetailsController.text.isNotEmpty;
  }

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
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => const AnnexureB(),
                                      ),
                                    );
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
                  const Spacer(),
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
                  const Spacer(),
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
                  const Spacer(),
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
                  const Spacer(),
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
                  if (_areTextControllersNotEmpty()) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AnnexureA1(),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
