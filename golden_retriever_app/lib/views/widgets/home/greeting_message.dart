// lib/views/widgets/home/greeting_message.dart

// 사용자에게 환영 메시지를 표시하는 위젯
import 'package:flutter/cupertino.dart';

class GreetingMessage extends StatelessWidget {
  final String username;

  const GreetingMessage({super.key, required this.username});

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

    final greeting = _getGreeting();
    return Padding(
      padding: EdgeInsets.only(top: size * 0.3, bottom: size * 0.2),
      child: Text(
        '$username 님,\n$greeting',
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: CupertinoColors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
