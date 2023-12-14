import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:justice_link/features/chat/widgets/chat_widgets.dart';
import 'package:justice_link/models/meeting.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, this.meeting}) : super(key: key);
  final Meeting? meeting;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();

  final List<Message> _messageList = [
    const Message(
        content: "Hi, Bill! This is the simplest example ever.",
        ownerType: OwnerType.sender,
        ownerName: "Higor Lapa"),
    const Message(
        content:
            "Let's make it better , Higor. Custom font size and text color",
        textColor: Colors.black38,
        ownerType: OwnerType.receiver,
        ownerName: "Bill Gates"),
    const Message(
        content: "Bill, we have to talk about business",
        ownerType: OwnerType.sender,
        ownerName: "Higor"),
    const Message(
        content: "Wow, I like it. Tell me what I can do for you, pal.",
        ownerType: OwnerType.receiver,
        ownerName: "Bill Gates"),
    const Message(
        content: "I'm just a copy",
        ownerType: OwnerType.sender,
        ownerName: "Higor"),
    const Message(
        content: "Nice",
        ownerType: OwnerType.receiver,
        ownerName: "Bill Gates"),
    const Message(
        content: "I'm just a copy",
        ownerType: OwnerType.sender,
        ownerName: "Higor"),
    const Message(
        content: "Nice",
        ownerType: OwnerType.receiver,
        ownerName: "Bill Gates"),
    const Message(
        content: "I'm just a copy",
        ownerType: OwnerType.receiver,
        ownerName: "Bill Gates"),
    const Message(
        content: "Nice",
        ownerType: OwnerType.receiver,
        ownerName: "Bill Gates"),
    const Message(
        content: "I'm just a copy",
        ownerType: OwnerType.sender,
        ownerName: "Higor"),
    const Message(
        content: "I'm just a copy",
        ownerType: OwnerType.sender,
        ownerName: "Higor"),
  ];

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Chat Bot"),
        centerTitle: true,
        elevation: 5,
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF098904),
        shadowColor: const Color.fromARGB(255, 72, 73, 72),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.call,
                color: Colors.white,
              ),
            ),
          ),
        ],
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Color(0xFF046200)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatList(
              scrollController: _scrollController,
              children: _messageList,
            ),
          ),
          widget.meeting!=null ? 
          widget.meeting?.meetingStatus == 'pending' ? Container():
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                          hintText: 'Type a message...',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.photo),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        _sendMessage(_textEditingController.text);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ):   Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                          hintText: 'Type a message...',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.photo),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        _sendMessage(_textEditingController.text);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      _messageList.add(
        Message(
          content: text,
          ownerType: OwnerType.sender,
          ownerName: "Your Name",
        ),
      );
      _textEditingController.clear();

      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );

      setState(() {});
    }
  }
}
