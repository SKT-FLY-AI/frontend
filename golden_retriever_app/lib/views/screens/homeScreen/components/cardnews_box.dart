// lib/views/screens/homeScreen/components/cardnews_box.dart

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../models/data/cardnews_list.dart';
import 'cardnews_screen.dart';

class CardNewsBox extends StatefulWidget {
  @override
  _CardNewsBoxState createState() => _CardNewsBoxState();
}

class _CardNewsBoxState extends State<CardNewsBox> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _currentPageNotifier.value = (_pageController.page?.round() ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: contextHeight * 0.25, horizontal: contextWidth * 0.6),
      child: Stack(
        children: [
          Container(
            height: contextHeight * 1.7,
            decoration: BoxDecoration(
              color: Colors.deepPurple.withOpacity(0.3), // 반투명 배경색
              borderRadius: BorderRadius.circular(16.0), // 모서리 둥글게
              border: Border.all(
                color: Colors.white.withOpacity(0.5), // 테두리 색상
                width: 1.0,
              ),
            ),
            child: PageView.builder(
              controller: _pageController,
              itemCount: cardnewsList.length, // 카드 뉴스 목록의 길이만큼 페이지를 생성
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => CardnewsScreen(index: index),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2), // 반투명 배경
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(color: Colors.white.withOpacity(0.3)),
                        ),
                        padding: EdgeInsets.all(contextHeight * 0.4), // 패딩 추가
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cardnewsList[index].title,
                                style: TextStyle(
                                  fontSize: contextHeight * 0.25, // 텍스트 사이즈 조금 크게
                                  fontWeight: FontWeight.bold, // 볼드체
                                  color: CupertinoColors.white, // 텍스트 색상
                                  decoration: TextDecoration.none, // 밑줄 제거
                                ),
                              ),
                              SizedBox(height: contextHeight * 0.1,),
                              Text(
                                cardnewsList[index].subtitle,
                                style: TextStyle(
                                  fontSize: contextHeight * 0.15, // 텍스트 사이즈 조금 크게
                                  fontWeight: FontWeight.w600, // 볼드체
                                  color: CupertinoColors.white, // 텍스트 색상
                                  decoration: TextDecoration.none, // 밑줄 제거
                                ),
                              ),
                            ]
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 10.0, // 원하는 위치에 배치
            right: 15.0,
            child: ValueListenableBuilder<int>(
              valueListenable: _currentPageNotifier,
              builder: (context, value, child) {
                return Text(
                  "${value + 1}/${cardnewsList.length}",
                  style: TextStyle(
                    color: CupertinoColors.systemGrey4,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    decoration: TextDecoration.none, // 밑줄 제거
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: cardnewsList.length,
                effect: WormEffect(
                  dotHeight: 8.0,
                  dotWidth: 8.0,
                  activeDotColor: Colors.white,
                  dotColor: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }
}
