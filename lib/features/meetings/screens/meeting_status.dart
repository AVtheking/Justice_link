import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/common/app_bar.dart';

class MeetingStatus extends ConsumerStatefulWidget {
  const MeetingStatus({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MeetingStatusState();
}

class _MeetingStatusState extends ConsumerState<MeetingStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfun("Meeting Status"),
    );
  }
}
