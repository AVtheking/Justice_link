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
    _chatBubbles.add(const ChatBubble(
        'Hello I am Nyay Mitra . How can i Help you Today', false));
  }

  final TextEditingController _textEditingController = TextEditingController();
  List<ChatBubble> _chatBubbles = [];
  final ScrollController _scrollController = ScrollController();

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

  void _sendMessage() async {
    final userMessage = _textEditingController.text;
    _textEditingController.clear();
    if (userMessage.isNotEmpty) {
      try {
        setState(() {
          _chatBubbles.add(ChatBubble(userMessage, true));
          _chatBubbles.add(const ChatBubble('Typing...', false));
        });

        await Future.delayed(const Duration(seconds: 2));

        final response = await Gemini.instance.text(
            "now lets have a role play in which you will be my lawyer and i will ask you a sigle question related to law or any legal advice related to legal matters and you need to reply in detail in a step by step guide and you need to do that in a proper documentation but if the question is not releted to law or any legal matters then you will reply me please ask a relevant question so the next question will follow this guideline , remember that if a question is not releted to law or can not be related to law then do not answer it. follow this guideline only in the next question that i ask you after that the role play ends and remember to never use the word roleplay in the answer of the question that i give you during the role play in the next question $userMessage");
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
