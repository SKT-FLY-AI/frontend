// lib/views/screens/home_screen.dart

import 'package:flutter/cupertino.dart';
import '../widgets/home/cardnews_box.dart';
import '../widgets/home/chatlog_widget.dart';
import '../widgets/home/greeting_message.dart';
import '../widgets/home/home_menu_box.dart';
import '../widgets/home/weekly_progress.dart';
import '../widgets/home/badge_box.dart';

// 홈 화면을 나타내는 클래스
class HomeScreen extends StatelessWidget {
  final String? username;

  const HomeScreen({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return CupertinoPageScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GreetingMessage(username: username),
              HomeMenuBoxGrid(itemCount: 4),
              CardNewsBox(), // 카드 뉴스 위젯
              SizedBox(height: contextHeight * 0.2),
              WeeklyProgress(), // 주간 진행 상태 위젯
              BadgeBox(), // 배지 박스 위젯
              ChatlogWidgetColumn(itemCount: 2),
              SizedBox(height: contextHeight * 2),
            ],
          ),
        ),
      ),
    );
  }
}
