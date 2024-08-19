// lib/views/widgets/home/cardnews_box.dart

import 'package:flutter/cupertino.dart';
import '../../screens/cardnews_screen.dart';
import '../../data/cardnews_list.dart';

// 카드 뉴스 슬라이드를 표시하는 위젯
class CardNewsBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: contextHeight * 0.25, horizontal: contextWidth * 0.8,),
      child: Container(
        height: contextHeight * 2.7,
        child: PageView.builder(
          itemCount: cardnewsList.length,  // 카드 뉴스 목록의 길이만큼 페이지를 생성
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // 인덱스만 CardnewsScreen에 전달
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => CardnewsScreen(index: index),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: CupertinoColors.systemGrey.withOpacity(0.5),
                ),
                padding: EdgeInsets.all(contextHeight * 0.3), // 패딩 추가
                child: Align(
                  alignment: Alignment.topLeft, // 왼쪽 상단에 텍스트 배치
                  child: Text(
                    cardnewsList[index].title,
                    style: TextStyle(
                      fontSize: contextHeight * 0.25, // 텍스트 사이즈 조금 크게
                      fontWeight: FontWeight.bold, // 볼드체
                      color: CupertinoColors.white, // 텍스트 색상 (선택 사항)
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}