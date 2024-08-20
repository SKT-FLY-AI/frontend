// lib/screens/entertainment_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class EntertainmentScreen extends StatelessWidget {
  const EntertainmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        border: null, // 테두리 없음
        backgroundColor: CupertinoColors.transparent, // 상단바 색상 없음
      ),
      backgroundColor: Colors.orangeAccent,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.8),
            child: ListView(
              children: [
                // YouTube 추천 영상 섹션
                Padding(
                  padding: EdgeInsets.only(top: contextHeight * 0.2, bottom: contextHeight * 0.15),
                  child: Text(
                    "YouTube 추천 영상",
                    style: TextStyle(
                      fontSize: contextWidth * 0.45,
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none, // 밑줄 제거
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0), // 내부 여백
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3), // 반투명 배경색
                    borderRadius: BorderRadius.circular(16.0), // 모서리 둥글게
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5), // 테두리 색상
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: contextWidth * 0.2,
                      vertical: contextHeight * 0.15
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.2),
                              child: Image.asset('assets/images/poop_great.png', height: contextHeight * 1),
                            ),
                            SizedBox(width: contextWidth * 0.3,),
                            Text(
                              "영상 제목",
                              style: TextStyle(
                                fontSize: contextWidth * 0.4,
                                fontWeight: FontWeight.w600,
                                color: CupertinoColors.white, // 텍스트 색상
                                decoration: TextDecoration.none, // 밑줄 제거
                              )
                            ),
                          ],
                        ),
                        SizedBox(height: contextHeight * 0.1,),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.2),
                              child: Image.asset('assets/images/poop_great.png', height: contextHeight * 1),
                            ),
                            SizedBox(width: contextWidth * 0.3,),
                            Text(
                                "영상 제목",
                                style: TextStyle(
                                  fontSize: contextWidth * 0.4,
                                  fontWeight: FontWeight.w600,
                                  color: CupertinoColors.white, // 텍스트 색상
                                  decoration: TextDecoration.none, // 밑줄 제거
                                )
                            ),
                          ],
                        ),
                        SizedBox(height: contextHeight * 0.1,),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.2),
                              child: Image.asset('assets/images/poop_great.png', height: contextHeight * 1),
                            ),
                            SizedBox(width: contextWidth * 0.3,),
                            Text(
                                "영상 제목",
                                style: TextStyle(
                                  fontSize: contextWidth * 0.4,
                                  fontWeight: FontWeight.w600,
                                  color: CupertinoColors.white, // 텍스트 색상
                                  decoration: TextDecoration.none, // 밑줄 제거
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // 건강 뉴스 섹션
                Padding(
                  padding: EdgeInsets.only(top: contextHeight * 0.3, bottom: contextHeight * 0.15),
                  child: Text(
                    "건강 뉴스",
                    style: TextStyle(
                      fontSize: contextWidth * 0.45,
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none, // 밑줄 제거
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(16.0), // 내부 여백
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3), // 반투명 배경색
                      borderRadius: BorderRadius.circular(16.0), // 모서리 둥글게
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5), // 테두리 색상
                        width: 1.0,
                      ),
                    ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: contextWidth * 0.2,
                        vertical: contextHeight * 0.15
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CupertinoListTile(
                          title: Text(
                            "건강 뉴스 1",
                            style: TextStyle(color: CupertinoColors.white),
                          ),
                        ),
                        SizedBox(height: contextHeight * 0.15,),
                        CupertinoListTile(
                          title: Text(
                            "건강 뉴스 2",
                            style: TextStyle(color: CupertinoColors.white),
                          ),
                        ),
                        SizedBox(height: contextHeight * 0.15,),
                        CupertinoListTile(
                          title: Text(
                            "건강 뉴스 3",
                            style: TextStyle(color: CupertinoColors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                ),

                // PoopSee News 섹션
                Padding(
                  padding: EdgeInsets.only(top: contextHeight * 0.3, bottom: contextHeight * 0.15),
                  child: Text(
                    "PoopSee News",
                    style: TextStyle(
                      fontSize: contextWidth * 0.45,
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none, // 밑줄 제거
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0), // 내부 여백
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3), // 반투명 배경색
                    borderRadius: BorderRadius.circular(16.0), // 모서리 둥글게
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5), // 테두리 색상
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: contextWidth * 0.2,
                        vertical: contextHeight * 0.15
                    ),
                    child: SizedBox(height: contextHeight,),
                  ),
                ),
                SizedBox(height: contextHeight * 3,),
              ],
            ),
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
      padding: EdgeInsets.symmetric(vertical: contextHeight * 0.1, horizontal: contextWidth * 0.05),
      onPressed: onTap,
      child: Align(
        alignment: Alignment.centerLeft,
        child: title,
      ),
    );
  }
}
