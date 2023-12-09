import 'package:flutter/material.dart';
import 'package:justice_link/features/document_verification/widgets/required_documents_container.dart';
import 'package:justice_link/common/app_bar.dart';

class DocumentVerification extends StatefulWidget {
  const DocumentVerification({Key? key}) : super(key: key);

  @override
  State<DocumentVerification> createState() => _DocumentVerificationState();
}

class _DocumentVerificationState extends State<DocumentVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfun("Document Verification"),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Column(
              children: [
                RequiredDocuments(
                  title: "Government Issued-ID",
                  onAddFilePressed: () {},
                ),
                const SizedBox(
                  height: 24,
                ),
                RequiredDocuments(
                  title: "Aadhar Card",
                  onAddFilePressed: () {},
                ),
                const SizedBox(
                  height: 24,
                ),
                RequiredDocuments(
                  title: "Address Proof",
                  onAddFilePressed: () {},
                ),
                const SizedBox(
                  height: 24,
                ),
                RequiredDocuments(
                  title: "Legal Documents",
                  onAddFilePressed: () {},
                ),
                const SizedBox(
                  height: 24,
                ),
                RequiredDocuments(
                  title: "Passport Size Photograph",
                  onAddFilePressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Image.asset(
            'assets/images/par.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 131,
          ),
        ],
      ),
    );
  }
}
