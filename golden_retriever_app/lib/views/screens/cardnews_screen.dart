// lib/views/screens/cardnews_screen.dart

import 'package:flutter/cupertino.dart';
import '../data/cardnews_list.dart';


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
        middle: Text('카드 뉴스'),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: contextHeight * 1.5, horizontal: contextWidth),
          child: Column(
            children: [
              Text(
                cardnews.title,
                  style: TextStyle(
                    fontSize: contextWidth * 0.5,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black,
                  ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  'assets/images/cardnews/card-image-${index + 1}.png',  // 인덱스에 따라 이미지 로드
                  fit: BoxFit.cover,
                ),
              ),
              Text(cardnews.content),
            ],
          )
        ),
      ),
    );
  }
}
