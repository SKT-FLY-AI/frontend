// lib/screens/profile_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class ProfileScreen extends StatelessWidget {
  final String? username;

  const ProfileScreen({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        border: null, // 테두리 없음
        backgroundColor: CupertinoColors.transparent, // 상단바 색상 없음
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.8),
            child: ListView(
              children: [
                // 프로필 섹션 박스로 감싸기
                Padding(
                  padding: EdgeInsets.only(top: contextHeight * 0.3, bottom: contextHeight * 0.2),
                  child: Container(
                    padding: EdgeInsets.all(16.0), // 내부 여백
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3), // 반투명 배경색
                      borderRadius: BorderRadius.circular(16.0), // 모서리 둥글게
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5), // 테두리 색상
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: contextWidth * 0.8,
                          backgroundImage: AssetImage('assets/profile.jpg'),
                        ),
                        SizedBox(width: contextWidth * 0.3),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              username!,
                              style: TextStyle(
                                fontSize: contextWidth * 0.5,
                                fontWeight: FontWeight.bold,
                                color: CupertinoColors.white, // 텍스트 색상
                                decoration: TextDecoration.none, // 밑줄 제거
                              ),
                            ),
                            SizedBox(height: contextHeight * 0.1),
                            Text(
                              "status message",
                              style: TextStyle(
                                color: CupertinoColors.inactiveGray,
                                fontSize: contextWidth * 0.35,
                                decoration: TextDecoration.none, // 밑줄 제거
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // 메뉴 리스트 섹션
                Container(
                  padding: EdgeInsets.symmetric(vertical: contextHeight * 0.2),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3), // 반투명 배경색
                    borderRadius: BorderRadius.circular(16.0), // 모서리 둥글게
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5), // 테두리 색상
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    children: [
                      CupertinoListTile(
                        title: Text(
                          "환경 설정",
                          style: TextStyle(color: CupertinoColors.white),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          "질병 정보 등록",
                          style: TextStyle(color: CupertinoColors.white),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          "건강 연동하기",
                          style: TextStyle(color: CupertinoColors.white),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          "가족 등록하기",
                          style: TextStyle(color: CupertinoColors.white),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          "광고 제거하기",
                          style: TextStyle(color: CupertinoColors.white),
                        ),
                      ),
                    ],
                  ),
                ),

                // About us 섹션
                Padding(
                  padding: EdgeInsets.symmetric(vertical: contextHeight * 0.2),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: contextHeight * 0.1,),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3), // 반투명 배경색
                      borderRadius: BorderRadius.circular(16.0), // 모서리 둥글게
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5), // 테두리 색상
                        width: 1.0,
                      ),
                    ),
                    child: CupertinoListTile(
                      title: Text(
                        "About us",
                        style: TextStyle(color: CupertinoColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBottomNavigationBar(
              currentIndex: 4,
              onTap: (currentIndex) {
                // CustomBottomNavigationBar의 네비게이션 핸들러는 이미 정의되어 있으므로 추가 작업 불필요
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CupertinoListTile extends StatelessWidget {
  final Widget title;
  final Function()? onTap;

  CupertinoListTile({
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return CupertinoButton(
      padding: EdgeInsets.symmetric(vertical: contextHeight * 0.2, horizontal: contextWidth),
      onPressed: onTap,
      child: Align(
        alignment: Alignment.centerLeft,
        child: title,
      ),
    );
  }
}
