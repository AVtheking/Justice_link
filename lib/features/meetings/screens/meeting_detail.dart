import 'package:flutter/material.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/features/meetings/widgets/meeting_detail_form.dart';
import 'package:justice_link/models/lawyer.dart';

class MeetingDetails extends StatefulWidget {
  const MeetingDetails({super.key, required this.lawyer});
  final Lawyer lawyer;

  @override
  State<MeetingDetails> createState() => _MeetingDetailsState();
}

class _MeetingDetailsState extends State<MeetingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarfun("Meeting Details"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: MeetingDetailForm(lawyer: widget.lawyer),
          ),
        ));
  }
}
