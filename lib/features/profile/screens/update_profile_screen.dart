import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/features/auth/services/auth_service.dart';
import 'package:justice_link/features/auth/widgets/text_field.dart';
import 'package:justice_link/features/profile/services/profile_service.dart';

class UpdateProfile extends ConsumerStatefulWidget {
  const UpdateProfile({super.key});

  @override
  ConsumerState<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends ConsumerState<UpdateProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _lawyerIdController = TextEditingController();
  final TextEditingController _skillController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _lawyerIdController.dispose();
    _skillController.dispose();
    _bioController.dispose();
    _experienceController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void updateProfile(BuildContext context, String id) {
    ref.read(profileServiceProvider).updateProfile(
        context: context,
        id: id,
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        lawyerId: _lawyerIdController.text.trim(),
        lawyerSkills: _skillController.text.trim(),
        lawyerExperience: _experienceController.text.trim(),
        location: _locationController.text.trim(),
        lawyerbio: _bioController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final lawyer = ref.read(lawyerProvider)!;
    _nameController.text = lawyer.name;
    _emailController.text = lawyer.email;
    return Scaffold(
      appBar: appbarfun("Your Profile"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/profile2.png"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.camera_alt_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Change Profile Picture",
                            style: TextStyle(
                                // color: Color(0xFF046200),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Change Profile Picture",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegisterField(
                      hintText: "Full Name",
                      controller: _nameController,
                      icon: Icons.person),
                  const SizedBox(
                    height: 20,
                  ),
                  RegisterField(
                      hintText: "User@gmail.com",
                      controller: _emailController,
                      icon: Icons.email),
                  const SizedBox(
                    height: 20,
                  ),
                  RegisterField(
                      hintText: "Enter Lawyer ID",
                      controller: _lawyerIdController,
                      icon: Icons.email),
                  const SizedBox(
                    height: 20,
                  ),
                  RegisterField(
                      hintText: "Enter your Experience",
                      controller: _experienceController,
                      icon: Icons.timelapse_sharp),
                  const SizedBox(
                    height: 20,
                  ),
                  RegisterField(
                      hintText: "Enter your location",
                      controller: _locationController,
                      icon: Icons.explore),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Your Skills : ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RegisterField(
                    hintText: "Type here..",
                    controller: _skillController,
                    // icon: Icons.person
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Bio:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RegisterField(
                    hintText: "Type here..",
                    controller: _bioController,
                    // icon: Icons.person
                    maxlines: 5,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                updateProfile(context, lawyer.id!);
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                    'Update Profile',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            Image.asset(
              "assets/images/par.png",
              width: double.infinity,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
