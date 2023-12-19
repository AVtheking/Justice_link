import 'package:flutter/material.dart';
import 'package:justice_link/common/app_bar.dart';

class Guidelines extends StatelessWidget {
  const Guidelines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfun("Guidelines"),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/bullet.png'),
                  const Text(
                    ' User Privacy and Data Security:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                '[•] Prioritize the privacy and security of user data.\n[•] Implement encryption protocols for sensitive information.\n[•] Clearly communicate your data handling practices in the application.',
              ),
              const Divider(
                color: Color(0xFFCCCCCC),
                height: 20,
                thickness: 0.5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/bullet.png'),
                  const Text(
                    ' Legal Accuracy and Compliance',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                '[•] Ensure all legal information provided is accurate and up-to-date.\n[•] Comply with local, state, and national legal regulations.\n[•]Regularly review and update content to reflect any legal changes.',
              ),
              const Divider(
                color: Color(0xFFCCCCCC),
                height: 20,
                thickness: 0.5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/bullet.png'),
                  const Text(
                    ' User-Friendly Design',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                '[•] Create an intuitive and user-friendly interface for ease of navigation.\n[•] Prioritize accessibility to accommodate users with diverse needs.',
              ),
              const Divider(
                color: Color(0xFFCCCCCC),
                height: 20,
                thickness: 0.5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/bullet.png'),
                  const Text(
                    ' Transparency',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                '[•] Clearly communicate the application\'s purpose, features, and limitations to users.\n[•] Provide accessible terms of service and privacy policy documentation.',
              ),
              const Divider(
                color: Color(0xFFCCCCCC),
                height: 20,
                thickness: 0.5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/bullet.png'),
                  const Text(
                    ' Inclusivity and Non-Discrimination:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                '[•] Promote inclusivity and avoid discrimination based on race, gender, religion, or other protected characteristics.\n[•] Ensure the application serves the needs of a diverse user base.',
              ),
              const Divider(
                color: Color(0xFFCCCCCC),
                height: 20,
                thickness: 0.5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/bullet.png'),
                  const Text(
                    ' Legal Representation and Advice:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                '[•] Clearly convey that the application does not replace professional legal advice.\n[•] Encourage users to seek legal representation for their specific cases.',
              ),
              const Divider(
                color: Color(0xFFCCCCCC),
                height: 20,
                thickness: 0.5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/bullet.png'),
                  const Text(
                    ' Collaboration and Partnerships',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                '[•] Establish partnerships with reputable legal organizations, pro bono lawyers, and community networks.\n[•] Collaborate with relevant stakeholders to enhance the effectiveness of the application.',
              ),
              const Divider(
                color: Color(0xFFCCCCCC),
                height: 20,
                thickness: 0.5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/bullet.png'),
                  const Text(
                    ' Continuous Improvement',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                '[•] Regularly gather user feedback and insights for continuous improvement.\n[•] Stay updated on technological advancements and legal changes to enhance the application\'s features.',
              ),
              const Divider(
                color: Color(0xFFCCCCCC),
                height: 20,
                thickness: 0.5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/bullet.png'),
                  const Text(
                    ' Emergency Response and Support: ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                '[•] Provide clear instructions for users in case of emergencies.\n[•] Offer support resources for mental health and crisis situations.',
              ),
              const Divider(
                color: Color(0xFFCCCCCC),
                height: 20,
                thickness: 0.5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/bullet.png'),
                  const Text(
                    ' Education and Awrareness:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                '[•] Include educational resources to enhance users\' understanding of legal processes.\n[•] Promote awareness of legal rights and responsibilities.',
              ),
              const Divider(
                color: Color(0xFFCCCCCC),
                height: 20,
                thickness: 0.5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/bullet.png'),
                  const Text(
                    ' Security Measures for Undertrial\n Prisioners',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                '[•] Implement security measures to protect the identity and safety of undertrial prisoners using the application.\n[•] Collaborate with law enforcement agencies to ensure secure communication channels.',
              ),
              const Divider(
                color: Color(0xFFCCCCCC),
                height: 20,
                thickness: 0.5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/bullet.png'),
                  const Text(
                    ' Compliance and Ethical Standards: ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                '[•] Uphold the highest ethical standards in all aspects of application development and usage.\n[•] Foster a culture of integrity within the "JusticeLink" community.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
