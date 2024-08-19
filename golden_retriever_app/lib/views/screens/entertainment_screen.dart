// lib/screens/entertainment_screen.dart

import 'package:flutter/cupertino.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class EntertainmentScreen extends StatefulWidget {
  const EntertainmentScreen({
    super.key,
  });

  @override
  _EntertainmentScreen createState() => _EntertainmentScreen();
}

class _EntertainmentScreen extends State<EntertainmentScreen> {
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
                SizedBox(height: contextHeight * 0.5,),
                Text("YouTube 추천 영상"),
                Expanded(
                  child: ListView(
                    children: [
                      CupertinoListTile(
                        title: Text(
                          "추천 영상 1",
                          style: TextStyle(color: CupertinoColors.black),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          "추천 영상 2",
                          style: TextStyle(color: CupertinoColors.black),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          "추천 영상 3",
                          style: TextStyle(color: CupertinoColors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Text("건강 뉴스"),
                Expanded(
                  child: ListView(
                    children: [
                      CupertinoListTile(
                        title: Text(
                          "건강 뉴스 1",
                          style: TextStyle(color: CupertinoColors.black),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          "건강 뉴스 2",
                          style: TextStyle(color: CupertinoColors.black),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          "건강 뉴스 3",
                          style: TextStyle(color: CupertinoColors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Text("PoopSee News"),
                Expanded(
                  child: ListView(
                    children: [
                      CupertinoListTile(
                        title: Text(
                          "뉴스 1",
                          style: TextStyle(color: CupertinoColors.black),
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
                currentIndex: 3,
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
