import 'package:flutter/material.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:justice_link/features/chat_bot/screens/chat_bot_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfun("Chat with our support team"),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            const Text(
              "How can we \n  help you?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "    We are available 24/7 to help you\n with our assistance so that you have \n   a seamless experience throughout\n                       the process",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              "assets/images/email.png",
              height: 50,
              width: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Send us an Email:",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "info@customerchatbot.io",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF046200),
                    Color(0xFF098904),
                  ],
                ),
              ),
              child: TextButton(
                onPressed: () {},
                child: SizedBox(
                  width: 90,
                  child: GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse("tel://11111111"));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/telephone.png'),
                        const SizedBox(
                          width: 12,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            'Call ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ChatBotScreen(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey)),
                height: 30,
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image.asset('assets/images/robot 1.png'),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const Text(
                      'Contact Live Chat',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Intel',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 16,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
