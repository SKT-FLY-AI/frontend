// lib/screens/profile_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: contextWidth * 0.4,
                    vertical: contextHeight * 0.5,
                  ),
                  child: Row(
                    children: [
                      // 프로필 이미지와 텍스트
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/profile.jpg'),
                      ),
                      SizedBox(width: contextWidth * 0.3),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "username",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: contextHeight * 0.03),
                          Text(
                            "status message",
                            style: TextStyle(
                              color: CupertinoColors.inactiveGray,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      CupertinoListTile(
                        title: Text(
                          "환경 설정",
                          style: TextStyle(color: CupertinoColors.black),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          "질병 정보 등록",
                          style: TextStyle(color: CupertinoColors.black),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          "건강 연동하기",
                          style: TextStyle(color: CupertinoColors.black),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          "가족 등록하기",
                          style: TextStyle(color: CupertinoColors.black),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          "광고 제거하기",
                          style: TextStyle(color: CupertinoColors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      CupertinoListTile(
                        title: Text(
                          "About us",
                          style: TextStyle(color: CupertinoColors.inactiveGray),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return CupertinoButton(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: contextWidth),
      onPressed: onTap,
      child: Align(
        alignment: Alignment.centerLeft,
        child: title,
      ),
    );
  }
}
