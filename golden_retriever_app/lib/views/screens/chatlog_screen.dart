// lib/screens/chatlog_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'chatbot_screen.dart'; // ChatbotScreen의 대화 기록에 접근하기 위해 임포트

class ChatLogScreen extends StatelessWidget {
  final DateTime date;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  ChatLogScreen({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    final chatLog = _getChatLog(date);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('챗로그 (${_dateFormat.format(date)})'),
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
          child: Text('해당 날짜에 대화 기록이 없습니다.'),
        ),
      ),
    );
  }

  List<Map<String, String>> _getChatLog(DateTime date) {
    // 날짜와 시간을 제거하고 날짜만 비교
    final dateOnly = DateTime(date.year, date.month, date.day);
    return ChatbotScreenState.chatLogs[dateOnly] ?? [];
  }
}
