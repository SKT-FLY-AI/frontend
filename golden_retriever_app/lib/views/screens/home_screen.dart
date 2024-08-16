// lib/views/screens/home_screen.dart

import 'package:flutter/cupertino.dart';
import '../widgets/info_card.dart';

// 홈 화면을 나타내는 클래스
class HomeScreen extends StatelessWidget {
  final CupertinoTabController tabController;
  final String username;

  const HomeScreen({
    Key? key,
    required this.tabController,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GreetingMessage(username: username),
              const InfoCardGrid(itemCount: 50),
            ],
          ),
        ),
      ),
    );
  }
}

// 사용자에게 환영 메시지를 표시하는 위젯
class GreetingMessage extends StatelessWidget {
  final String username;

  const GreetingMessage({Key? key, required this.username}) : super(key: key);

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
    final greeting = _getGreeting();
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Text(
        '$username 님, $greeting',
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: CupertinoColors.black,
        ),
      ),
    );
  }
}

class InfoCardGrid extends StatelessWidget {
  final int itemCount;

  const InfoCardGrid({Key? key, required this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 1,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return InfoCard(
            title: 'Title $index',
            detail: 'Detail for $index',
          );
        },
      ),
    );
  }
}
