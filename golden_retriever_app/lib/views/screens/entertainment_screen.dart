// lib/screens/entertainment_screen.dart

import 'package:flutter/cupertino.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class EntertainmentScreen extends StatelessWidget {
  final CupertinoTabController tabController;
  final String content;

  const EntertainmentScreen({
    super.key,
    required this.tabController,
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
              currentIndex: 3, // 선택된 탭의 인덱스 설정
              onTap: (index) {
                // 네비게이션을 위한 핸들러 추가
                tabController.index = index;
              },
            ),
          ),
        ],
      )
    );
  }
}
