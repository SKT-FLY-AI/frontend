// lib/views/widgets/home/cardnews_box.dart

import 'package:flutter/cupertino.dart';

// 카드 뉴스 슬라이드를 표시하는 위젯
class CardNewsBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 32, left: 32, right: 32),
      child: Container(
        height: 220,
        child: PageView(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: CupertinoColors.systemGrey.withOpacity(0.5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  'assets/images/cardnews/snoopy-1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: CupertinoColors.systemGrey.withOpacity(0.5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  'assets/images/cardnews/snoopy-2.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: CupertinoColors.systemGrey.withOpacity(0.5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  'assets/images/cardnews/snoopy-3.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: CupertinoColors.systemGrey.withOpacity(0.5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  'assets/images/cardnews/snoopy-4.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
