import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/features/meetings/services/meeting_service.dart';
import 'package:justice_link/models/meeting.dart';

class MeetingRequest extends ConsumerStatefulWidget {
  const MeetingRequest({super.key});

  @override
  ConsumerState<MeetingRequest> createState() => _MeetingRequestState();
}

class _MeetingRequestState extends ConsumerState<MeetingRequest> {
  List<Meeting> meetings = [];
  getMeetingsRequest() async {
    meetings =
        await ref.read(meetingServiceProvider).getMeetingRequestsForLawyer(context);
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
        body: ListView.builder(
            itemCount: meetings.length,
            itemBuilder: (ctx, index) {
              return Card(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/lawyer.png"),
                    ),
                    title: Text(meetings[index].senderName),
                    subtitle: const Text("New Meeting Request"),
                  ),
                ),
              );
            }));
  }
}
