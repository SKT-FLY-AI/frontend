// lib/screens/entertainment_screen.dart

import 'package:flutter/cupertino.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class EntertainmentScreen extends StatelessWidget {
  // final CupertinoTabController tabController;
  final String content;

  const EntertainmentScreen({
    super.key,
    // required this.tabController,
    this.content = 'Entertainment Screen',
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Center(
            child: Text(content),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBottomNavigationBar(
              currentIndex: 3, // 현재 화면이 캘린더이므로 인덱스 1
              onTap: (currentIndex) {
                // CustomBottomNavigationBar의 네비게이션 핸들러는 이미 정의되어 있으므로 추가 작업 불필요
              },
            ),
          ),
        ],
      )
    );
  }
}

