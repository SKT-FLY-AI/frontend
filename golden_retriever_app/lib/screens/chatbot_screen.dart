// lib/screens/chatbot_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _sendInitialBotMessage();
  }

  void _sendInitialBotMessage() {
    setState(() {
      _messages.add({"sender": "bot", "text": "Hello, how are you feeling right now?"});
    });
  }

  void _sendMessage() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({"sender": "user", "text": _controller.text.trim()});
        // Simulate bot response (you could replace this with actual bot logic)
        _messages.add({"sender": "bot", "text": "I'm here to help!"});
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Chatbot'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.clear_circled),
          onPressed: () {
            Navigator.pop(context); // Close the chatbot dialog
          },
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  final isUser = message["sender"] == "user";
                  return Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: isUser
                            ? CupertinoColors.activeOrange
                            : CupertinoColors.systemGrey5,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Text(
                        message["text"]!,
                        style: TextStyle(
                          color: isUser
                              ? CupertinoColors.white
                              : CupertinoColors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoTextField(
                      controller: _controller,
                      placeholder: "Type a message",
                    ),
                  ),
                  CupertinoButton(
                    child: const Icon(
                      CupertinoIcons.arrow_right_circle_fill,
                      size: 40,
                    ),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
