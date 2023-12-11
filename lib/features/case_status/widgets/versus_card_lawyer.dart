import 'package:flutter/material.dart';

class VersusCardLawyer extends StatelessWidget {
  const VersusCardLawyer(
      {super.key,
      required this.victimController,
      required this.oppositionController});
  final TextEditingController victimController;
  final TextEditingController oppositionController;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Container(
        // height: 88,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 1,
              blurRadius: 20,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              // const Text(
              //   "Mehul Sharma",
              //   style: TextStyle(
              //       color: Color(0xFF004111),
              //       fontSize: 15,
              //       fontWeight: FontWeight.w600),
              // ),
              SizedBox(
                height: 35,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: victimController,
                  style: const TextStyle(
                      color: Color(0xFF004111),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Color(0xFF046200),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 44,
                height: 24,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFF004D14)),
                child: const Center(
                  child: Text(
                    "vs.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 35,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: oppositionController,
                  style: const TextStyle(
                      color: Color(0xFF004111),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Color(0xFF046200),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.black)),
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
