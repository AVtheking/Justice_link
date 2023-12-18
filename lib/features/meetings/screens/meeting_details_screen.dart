import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/features/chat/screens/chat_screen.dart';
import 'package:justice_link/features/meetings/services/meeting_service.dart';
import 'package:justice_link/models/meeting.dart';

class MeetingDetailsScreen extends ConsumerStatefulWidget {
  final Meeting meeting;

  MeetingDetailsScreen({required this.meeting});

  @override
  _MeetingDetailsScreenState createState() => _MeetingDetailsScreenState();
}

class _MeetingDetailsScreenState extends ConsumerState<MeetingDetailsScreen> {
  late Meeting _meeting;

  @override
  void initState() {
    _meeting = widget.meeting;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meeting Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Accused Name: ${_meeting.accusedName}'),
            Text('Applicant Name: ${_meeting.applicantName}'),
            Text('Case Type: ${_meeting.caseType}'),
            Text('Opposing Lawyer: ${_meeting.oppositionLawyerName}'),
            Text('Case No: ${_meeting.caseNo}'),
            Text('Court No: ${_meeting.courtName}'),
            Text('Case Details: ${_meeting.caseDetails}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await ref
                    .read(meetingServiceProvider)
                    .acceptMeetingRequest(context: context, meeting: _meeting);
                updateMeetingStatus('accepeted');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
              child: Text('Accept Meeting'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                ref
                    .read(meetingServiceProvider)
                    .declineMeetingRequest(context: context, meeting: _meeting);
                updateMeetingStatus('rejected');

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Meeting Rejected')),
                );
              },
              child: Text('Reject Meeting'),
            ),
          ],
        ),
      ),
    );
  }

  void updateMeetingStatus(String status) {
    setState(() {
      _meeting.meetingStatus = status;
    });
  }
}
