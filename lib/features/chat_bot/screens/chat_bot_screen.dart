import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:justice_link/common/app_bar.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  List<ChatBubble> _chatBubbles = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _chatBubbles.add(const ChatBubble(
        'Hello I am Nyay Mitra. How can I help you today?', false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffefe6dd),
      appBar: appbarfun('Nyay Mitra'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _chatBubbles.length,
                itemBuilder: (context, index) {
                  return _chatBubbles[index];
                },
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                      ),
                      onSubmitted: (_) {
                        _sendMessage();
                        _scrollToBottom();
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      _sendMessage();
                      _scrollToBottom();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendMessage() async {
    final userMessage = _textEditingController.text;
    _textEditingController.clear();

    if (userMessage.isNotEmpty) {
      try {
        setState(() {
          _chatBubbles.add(ChatBubble(userMessage, true));
          _chatBubbles.add(const ChatBubble('Typing...', false));
        });

        await Future.delayed(const Duration(seconds: 2));

        final response = await _postRequest(userMessage);

        setState(() {
          _chatBubbles.removeLast();
          _chatBubbles.add(ChatBubble(response['message'], false));
        });

        _scrollToBottom();
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  Future<Map<String, dynamic>> _postRequest(String userMessage) async {
    final url = Uri.parse('https://chatbot.anaskhan.site/');
    final response = await http.post(
      url,
      body: json.encode({'question': userMessage}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(response.body);
      throw Exception('Failed to post message');
    }
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const ChatBubble(this.message, this.isUser, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isUser ? Colors.green : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
