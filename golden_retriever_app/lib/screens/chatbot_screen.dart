// lib/screens/chatbot_screen.dart

import 'package:flutter/cupertino.dart';
import '../services/chatbot/chatbot_service.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false; // To show loading state while waiting for bot response

  @override
  void initState() {
    super.initState();
    _sendInitialBotMessage();
  }

  void _sendInitialBotMessage() {
    setState(() {
      _messages.add({
        "sender": "bot",
        "text": "Hello, how are you feeling right now?"
      });
    });
  }

  void _sendMessage() async {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({
          "sender": "user",
          "text": _controller.text.trim()
        });
        _controller.clear(); // Clear the text field immediately
        _isLoading = true;
      });

      String? response = await sendMessageToChatbot(_controller.text.trim());

      setState(() {
        if (response != null) {
          _messages.add({"sender": "bot", "text": response});
        } else {
          _messages.add({
            "sender": "bot",
            "text": "Sorry, I couldn't understand that. Could you try again?"
          });
        }
        _isLoading = false;
      });
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
                padding: const EdgeInsets.all(18.0),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  final isUser = message["sender"] == "user";
                  return Align(
                    alignment: isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
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
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CupertinoActivityIndicator(),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 8.0),  // Add margin to the left
                      child: CupertinoTextField(
                        controller: _controller,
                        placeholder: "Type a message",
                        padding: const EdgeInsets.fromLTRB(16.0, 14.0, 12.0, 16.0),
                      ),
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
