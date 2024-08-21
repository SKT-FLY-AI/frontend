// lib/views/screens/cardnews_screen.dart

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/cardnews_list.dart';

// 카드 뉴스 데이터를 포함하는 클래스
class CardnewsData {
  final String title;
  final String content;

  CardnewsData(this.title, this.content);
}

// 카드 뉴스 스크린을 나타내는 위젯
class CardnewsScreen extends StatelessWidget {
  final int index; // 인덱스만 받도록 수정

  const CardnewsScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final cardnews = cardnewsList[index];

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        border: null, // 테두리 없음
        backgroundColor: CupertinoColors.transparent, // 상단바 색상 없음
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: contextHeight * 1.5, horizontal: contextWidth * 0.6),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0), // 글래스모피즘 효과를 위한 모서리 둥글게 처리
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // 블러 효과 적용
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2), // 반투명 배경
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3), // 테두리 색상
                    width: 2.0,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: contextHeight * 0.4,
                    horizontal: contextWidth * 0.5
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Column의 크기를 내부 콘텐츠에 맞게 설정
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      cardnews.title,
                      style: TextStyle(
                        fontSize: contextWidth * 0.5,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.white,
                      ),
                    ),
                    SizedBox(height: contextHeight * 0.15),
                    Text(
                      cardnews.subtitle,
                      style: TextStyle(
                        fontSize: contextWidth * 0.4,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.white,
                        decoration: TextDecoration.none, // 밑줄 제거
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: contextHeight * 0.25),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          'assets/images/cardnews/card-image-${index + 1}.png',  // 인덱스에 따라 이미지 로드
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.3),
                      child: Text(
                        cardnews.content,
                        style: TextStyle(
                          fontSize: contextWidth * 0.33,
                          fontWeight: FontWeight.normal,
                          color: CupertinoColors.white,
                          decoration: TextDecoration.none, // 밑줄 제거
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
