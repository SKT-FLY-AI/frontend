// lib/views/widgets/home/cardnews_box.dart

import 'package:flutter/cupertino.dart';
import '../../screens/cardnews_screen.dart';

// 카드 뉴스 슬라이드를 표시하는 위젯
class CardNewsBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 32, left: 32, right: 32),
      child: Container(
        height: contextHeight * 3,
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    'assets/images/cardnews/snoopy-${index + 1}.png',  // 인덱스에 따라 이미지 로드
                    fit: BoxFit.cover,
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