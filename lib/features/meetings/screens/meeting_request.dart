// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/features/chat/screens/chat_screen.dart';
import 'package:justice_link/features/meetings/screens/meeting_details_screen.dart';
import 'package:justice_link/features/meetings/services/meeting_service.dart';
import 'package:justice_link/models/meeting.dart';

class MeetingRequest extends ConsumerStatefulWidget {
  const MeetingRequest({super.key});

  @override
  ConsumerState<MeetingRequest> createState() => _MeetingRequestState();
}

class _MeetingRequestState extends ConsumerState<MeetingRequest> {
  void navigateToMeetingDetails(Meeting meeting) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MeetingDetailsScreen(meeting: meeting),
      ),
    );
  }

  List<Meeting?>? meetings;
  getMeetingsRequest() async {
    meetings = await ref
        .read(meetingServiceProvider)
        .getMeetingRequestsForLawyer(context);

    setState(() {});
  }

  @override
  void initState() {
    getMeetingsRequest();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Color(0xFF046200)),
          backgroundColor: const Color(0xFF098904),
          title: const Text(
            "Meeting Requests",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: Colors.white,
            )
          ],
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: meetings == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: meetings!.length,
                itemBuilder: (ctx, index) {
                  // print(meetings[index].meetingStatus);
                  final meeting = meetings![index]!;
                  return Card(
                    child: InkWell(
                      onTap: () {
                        if (meetings![index]!.meetingStatus == 'accepted') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ChatScreen(meeting: meeting)),
                          );
                        } else {
                          navigateToMeetingDetails(meetings![index]!);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: const CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage("assets/images/lawyer.png"),
                          ),
                          title: Text(meeting.senderName),
                          subtitle: const Text("New Meeting Request"),
                          trailing: Text(
                            meeting.meetingStatus!,
                            style: TextStyle(
                                color: meeting.meetingStatus == "accepted"
                                    ? const Color.fromARGB(255, 11, 132, 15)
                                    : const Color.fromARGB(255, 239, 146, 46),
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ));
  }
}
