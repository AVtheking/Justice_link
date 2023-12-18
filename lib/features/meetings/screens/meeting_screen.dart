import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/features/meetings/services/meeting_service.dart';
import 'package:justice_link/features/meetings/widgets/lawyer_card.dart';
import 'package:justice_link/models/lawyer.dart';
import 'package:justice_link/models/meeting.dart';

class MeetingScreen extends ConsumerStatefulWidget {
  const MeetingScreen({super.key});

  @override
  ConsumerState<MeetingScreen> createState() => _MeetingState();
}

class _MeetingState extends ConsumerState<MeetingScreen> {
  List<Lawyer?>? lawyers;
  List<Meeting> meetings = [];
  getLawyers() async {
    lawyers = await ref.read(meetingServiceProvider).getAllLawyers(context);
    setState(() {});
  }

  @override
  void initState() {
    getLawyers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfun("Meetings"),
      body: lawyers == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: lawyers!.length,
              itemBuilder: (context, index) {
                return LawyerCard(
                  lawyer: lawyers![index]!,
                );
              },
            ),
    );
  }
}
