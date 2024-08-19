// lib/screens/chatlog_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'chatbot_screen.dart';

class ChatLogScreen extends StatelessWidget {
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  ChatLogScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chatLog = _getChatLog();

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('챗로그'),
      ),
      child: SafeArea(
        child: chatLog.isNotEmpty
            ? ListView.builder(
          padding: const EdgeInsets.all(18.0),
          itemCount: chatLog.length,
          itemBuilder: (context, index) {
            final message = chatLog[index];
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
        )
            : const Center(
          child: Text('대화 기록이 없습니다.'),
        ),
      ),
    );
  }

  List<Map<String, String>> _getChatLog() {
    return ChatbotScreenState.messages.toList();
  }
}
