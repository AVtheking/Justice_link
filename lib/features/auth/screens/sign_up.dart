import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/features/auth/screens/login_in.dart';
import 'package:justice_link/features/auth/services/auth_service.dart';
import 'package:justice_link/features/auth/widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends ConsumerStatefulWidget {
  const Register({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  int selectedOption = 1;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String? translation;
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    setLanguage();
    super.initState();
  }

  void register(BuildContext context) {
    selectedOption == 1
        ? ref.watch(authServiceProvider).register(
              context: context,
              name: _nameController.text.trim(),
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            )
        : ref.watch(authServiceProvider).registerLawyer(
              context: context,
              name: _nameController.text.trim(),
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            );
  }

  void setLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      translation = prefs.getString("language") ?? "English";
    });
    // print(prefs.getString("language"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Color(0xFF046200)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  translation == "Hindi" ? "रजिस्टर" : "Register",
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF46474B),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
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
                          child: ListTile(
                            contentPadding: const EdgeInsets.only(left: 1),
                            leading: Radio(
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
                            title: Text(
                              translation == "Hindi" ? "उपयोगकर्ता" : "User",
                              style: TextStyle(
                                color: selectedOption == 1
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
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
                        child: ListTile(
                          contentPadding: const EdgeInsets.only(left: 1),
                          leading: Radio(
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
                          title: Text(
                            translation == "Hindi" ? "वकील" : "Lawyer",
                            style: TextStyle(
                              color: selectedOption == 2
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              RegisterField(
                hintText: translation == "Hindi" ? "पूरा नाम" : "Full Name",
                controller: _nameController,
                icon: Icons.person,
              ),
              const SizedBox(
                height: 30,
              ),
              RegisterField(
                  hintText: translation == "Hindi"
                      ? "उपयोगकर्ता@gmail.com"
                      : "User@gmail.com",
                  controller: _emailController,
                  icon: Icons.mail),
              const SizedBox(
                height: 30,
              ),
              RegisterField(
                hintText: translation == "Hindi" ? "पासवर्ड" : "Password",
                controller: _passwordController,
                icon: Icons.lock,
                isVisible: true,
              ),
              const SizedBox(
                height: 30,
              ),
              RegisterField(
                hintText: translation == "Hindi"
                    ? "पासवर्ड की पुष्टि करें"
                    : "Confirm Password",
                controller: _confirmPasswordController,
                icon: Icons.lock,
                isVisible: true,
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  register(context);
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
                  child: Center(
                    child: Text(
                      translation == "Hindi" ? 'रजिस्टर' : 'Register',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    translation == "Hindi"
                        ? "पहले से पंजीकृत हैं? "
                        : "Already Registered? ",
                    style: const TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      translation == "Hindi" ? "लॉग इन" : "Login",
                      style: const TextStyle(color: Color(0xFF046200), fontSize: 16),
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
