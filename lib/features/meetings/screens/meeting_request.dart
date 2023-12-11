import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MeetingRequest extends StatefulWidget {
  const MeetingRequest({super.key});

  @override
  State<MeetingRequest> createState() => _MeetingRequestState();
}

class _MeetingRequestState extends State<MeetingRequest> {
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
            itemCount: 4,
            itemBuilder: (ctx, index) {
              return Card(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/lawyer.png"),
                    ),
                    title: Text("Samay Raina"),
                    subtitle: Text("New Meeting Request"),
                  ),
                ),
              );
            }));
  }
}
