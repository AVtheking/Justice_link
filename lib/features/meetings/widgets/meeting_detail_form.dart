import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/features/meetings/services/meeting_service.dart';
import 'package:justice_link/features/meetings/widgets/form_field.dart';
import 'package:justice_link/models/lawyer.dart';

class MeetingDetailForm extends ConsumerStatefulWidget {
  const MeetingDetailForm({super.key, required this.lawyer});
  final Lawyer lawyer;
  @override
  ConsumerState<MeetingDetailForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<MeetingDetailForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController accusedNameController = TextEditingController();
  TextEditingController applicantsNameController = TextEditingController();
  TextEditingController caseTypeController = TextEditingController();
  TextEditingController opposingLawyerController = TextEditingController();
  TextEditingController caseNoController = TextEditingController();
  TextEditingController courtNameController = TextEditingController();
  TextEditingController caseDetailsController = TextEditingController();

  void sendMeetingReq(BuildContext context) {
    // final user = ref.read(userProvider);
    ref.read(meetingServiceProvider).sendMeetingReq(
          context: context,
          lawyerId: widget.lawyer.id!,
          receiverName: widget.lawyer.name,
          accusedName: accusedNameController.text.trim(),
          applicantName: applicantsNameController.text.trim(),
          caseType: caseTypeController.text.trim(),
          oppositionLawyerName: opposingLawyerController.text.trim(),
          caseNo: caseNoController.text.trim(),
          courtName: courtNameController.text.trim(),
          caseDetails: caseDetailsController.text.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MeetingFormField(
            hintText: "Accused Name",
            controller: accusedNameController,
          ),
          const SizedBox(height: 20),
          MeetingFormField(
            hintText: "Applicant's Name/Family Member Name",
            controller: applicantsNameController,
          ),
          const SizedBox(height: 20),
          MeetingFormField(
            hintText: "Case Type",
            controller: caseTypeController,
          ),
          const SizedBox(height: 20),
          MeetingFormField(
            hintText: "Opposing Lawyer",
            controller: opposingLawyerController,
          ),
          const SizedBox(height: 20),
          MeetingFormField(
            hintText: "Case No",
            controller: caseNoController,
          ),
          const SizedBox(height: 20),
          MeetingFormField(
            hintText: "Court Name",
            controller: courtNameController,
          ),
          const SizedBox(height: 20),
          MeetingFormField(
            hintText: "Case Details",
            controller: caseDetailsController,
            maxlines: 5,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF046200),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              // Validate and submit the form
              if (_formKey.currentState?.validate() ?? false) {
                sendMeetingReq(context);
              }
            },
            child: const Text('Send Meeting Request'),
          ),
        ],
      ),
    );
  }
}
