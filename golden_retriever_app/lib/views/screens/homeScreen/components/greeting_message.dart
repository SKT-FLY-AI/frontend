// lib/views/widgets/home/greeting_message.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GreetingMessage extends StatelessWidget {
  final String? dogName;

  const GreetingMessage({super.key, required this.dogName});

  // 현재 시간을 기준으로 인사말을 결정하는 함수
  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return '좋은 아침입니다!';
    } else if (hour >= 12 && hour < 18) {
      return '좋은 하루 되세요!';
    } else {
      return '편안한 밤 되세요!';
    }
  }

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width * 0.4;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    final greeting = _getGreeting();
    return Padding(
      padding: EdgeInsets.only(top: size * 0.3, bottom: size * 0.2),
      child: Text(
        '$dogName 견주님,\n$greeting',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: CupertinoColors.white,
          decoration: TextDecoration.none, // 밑줄 제거
          shadows: [
            Shadow(
              offset: Offset(2.0, 2.0), // 그림자의 위치
              blurRadius: 10.0, // 그림자의 블러 정도
              color: Colors.black.withOpacity(0.5), // 그림자 색상 및 투명도
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
