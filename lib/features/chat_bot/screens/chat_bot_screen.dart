import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/global.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  @override
  void initState() {
      Gemini.init(apiKey: apiKEY);
    super.initState();
    _chatBubbles.add(
        ChatBubble('Hello I am Nyay Mitra . How can i Help you Today', false));
  }

  final TextEditingController _textEditingController = TextEditingController();
  List<ChatBubble> _chatBubbles = [];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffefe6dd),
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
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                      ),
                      onSubmitted: (_) {
                        _sendMessage();
                        _scrollToBottom();
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
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

  void _sendMessage() async {
    final userMessage = _textEditingController.text;
    _textEditingController.clear();
    if (userMessage.isNotEmpty) {
      try {
        setState(() {
          _chatBubbles.add(ChatBubble(userMessage, true));
          _chatBubbles.add(ChatBubble('Typing...', false));
        });

        await Future.delayed(Duration(seconds: 2));

        final response = await Gemini.instance.text(userMessage);

        setState(() {
          _chatBubbles.removeLast();
          _chatBubbles
              .add(ChatBubble(response?.output ?? 'No response', false));
        });

        _scrollToBottom();
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
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
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isUser ? Colors.green : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
