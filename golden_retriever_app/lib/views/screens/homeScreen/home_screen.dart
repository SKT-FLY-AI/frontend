// lib/views/screens/home_screen.dart

import 'package:flutter/cupertino.dart';
import '../../expandable_fab.dart';
import '../../rive_background.dart';
import 'components/chatlog_widget.dart';
import 'components/cardnews_box.dart';
import 'components/greeting_message.dart';
import 'components/home_menu_box.dart';
import 'components/weekly_badge_widget.dart';

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

    return CupertinoPageScaffold(
      child: Stack(
        children: [
          const RiveBackground(), // 애니메이션 배경 추가
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GreetingMessage(username: username),
                  // HomeMenuBoxGrid(itemCount: 4, username: username),
                  CardNewsBox(), // 카드 뉴스 위젯
                  SizedBox(height: contextHeight * 0.2),
                  BadgeBox(), // 배지 박스 위젯
                  ChatlogWidgetColumn(itemCount: 3),
                  SizedBox(height: contextHeight * 2),
                ],
              ),
            ),
          ),
          const GlobalExpandableFab(), // GlobalExpandableFab 추가
        ],
      ),
    );
  }
}
