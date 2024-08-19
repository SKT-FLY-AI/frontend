// lib/screens/chatlog_screen.dart

import 'package:flutter/cupertino.dart';
import '../data/chatlog_list.dart';

class ChatLogScreen extends StatelessWidget {
  const ChatLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('챗로그'),
      ),
      child: SafeArea(
        child: chatlogList.isNotEmpty
            ? ListView.builder(
          reverse: true,
          padding: EdgeInsets.all(contextHeight * 0.2),
          itemCount: chatlogList.length,
          itemBuilder: (context, index) {
            final message = chatlogList[index];
            final isUser = message.sender == "user"; // 발신자가 사용자(user)인지 확인

            return Column(
              crossAxisAlignment: isUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: contextHeight * 0.07,
                    bottom: contextHeight * 0.07,
                    right: !isUser ? contextWidth * 1.4 : 0.2,
                    left: isUser ? contextWidth * 1.4 : 0.2,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(contextHeight * 0.2),
                    decoration: BoxDecoration(
                      color: isUser
                          ? CupertinoColors.activeOrange
                          : CupertinoColors.systemGrey5,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Text(
                      message.message,
                      style: TextStyle(
                        color: isUser
                            ? CupertinoColors.white
                            : CupertinoColors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: isUser ? contextWidth * 0.3 : 0,
                    left: !isUser ? contextWidth * 0.3 : 0,
                  ),
                  child: Text(
                    message.chatTime,
                    style: const TextStyle(
                      color: CupertinoColors.systemGrey,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            );
          },
        )
            : const Center(
          child: Text('대화 기록이 없습니다.'),
        ),
      ),
    );
  }
}

