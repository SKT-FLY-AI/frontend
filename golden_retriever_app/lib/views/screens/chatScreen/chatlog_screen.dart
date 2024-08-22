// lib/screens/chatlog_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui';

import '../../../models/data/chatlog_list.dart'; // 글라스모피즘 효과를 위한 임포트

class ChatLogScreen extends StatelessWidget {
  const ChatLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    String formatDate(String chatTime) {
      final dateTime = DateTime.parse(chatTime);
      return DateFormat('yyyy년 MM월 dd일').format(dateTime); // 날짜만 표시
    }

    String formatTime(String chatTime) {
      final dateTime = DateTime.parse(chatTime);
      return DateFormat('h:mm a').format(dateTime); // 시간과 분만 표시 (오전/오후 포함)
    }

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        border: null,
        backgroundColor: CupertinoColors.transparent,
      ),
      child: SafeArea(
        child: chatlogList.isNotEmpty
            ? ListView.builder(
          reverse: true,
          padding: EdgeInsets.all(contextHeight * 0.2),
          itemCount: chatlogList.length,
          itemBuilder: (context, index) {
            final message = chatlogList[index];
            final isUser = message.sender == "user";
            final previousMessage = index < chatlogList.length - 1 ? chatlogList[index + 1] : null;
            final currentDate = formatDate(message.chatTime);
            final previousDate = previousMessage != null ? formatDate(previousMessage.chatTime) : null;
            final showDate = previousDate != currentDate;

            return Column(
              crossAxisAlignment:
              isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (showDate)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: contextHeight * 0.3),
                    child: Center(
                      child: Text(
                        formatDate(message.chatTime), // 날짜만 표시
                        style: TextStyle(
                          fontSize: contextWidth * 0.35,
                          color: CupertinoColors.white,
                          decoration: TextDecoration.none,
                          shadows: [
                            Shadow(
                              offset: Offset(2.0, 2.0), // 그림자의 위치
                              blurRadius: 8.0, // 그림자의 블러 정도
                              color: Colors.black.withOpacity(0.2), // 그림자 색상 및 투명도
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(
                    top: contextHeight * 0.07,
                    bottom: contextHeight * 0.07,
                    right: isUser ? contextWidth * 0.25 : contextWidth * 1.4,
                    left: isUser ? contextWidth * 1.4 : contextWidth * 0.25,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: EdgeInsets.all(contextHeight * 0.25),
                        decoration: BoxDecoration(
                          color: isUser
                              ? CupertinoColors.systemGrey5.withOpacity(1)
                              : CupertinoColors.activeOrange.withOpacity(1),
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: CupertinoColors.white.withOpacity(0.2),
                            width: 1.0,
                          ),
                        ),
                        child: Text(
                          message.message,
                          style: TextStyle(
                            fontSize: contextWidth * 0.4,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                            color: isUser
                                ? CupertinoColors.black
                                : CupertinoColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: isUser ? contextWidth * 0.5 : 0,
                    left: !isUser ? contextWidth * 0.5 : 0,
                  ),
                  child: Text(
                    formatTime(message.chatTime), // 시간만 표시
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                      color: CupertinoColors.systemGrey,
                      fontSize: contextWidth * 0.3,
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
