/// lib/views/widgets/custom_bottom_navigation_bar.dart

import 'package:flutter/cupertino.dart';

/// 하단바를 구현한 위젯
class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height * 0.1;

    return Stack(
      children: [
        Container(
          height: screenHeight * 0.8,  // 전체 높이를 70으로 설정
          color: CupertinoColors.systemGrey6, // 탭바와 동일한 배경색
        ),
        Positioned(
          top: 0, left: 0,right: 0, bottom: 0,
          child: Align(
            alignment: Alignment.center, // 중앙 정렬
            child: CupertinoTabBar(
              backgroundColor: CupertinoColors.systemGrey6, // 탭바의 배경색 설정
              border: Border( // 상단 테두리(border) 제거
                top: BorderSide(color: CupertinoColors.systemGrey6, width: 0.0),
              ),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: '홈',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.calendar),
                  label: '캘린더',
                ),
                BottomNavigationBarItem(  // 가운데 비우기
                  icon: Spacer(),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.game_controller),
                  label: '엔터테인먼트',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person),
                  label: '내 정보',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
