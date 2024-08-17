// lib/views/widgets/home/badge_box.dart

import 'package:flutter/cupertino.dart';

class BadgeBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey.withOpacity(0.7),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 왼쪽 정렬
            children: [
              Text(
                '뱃지 현황',
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left, // 텍스트 왼쪽 정렬
              ),
              SizedBox(height: 18.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 뱃지 가운데 정렬 및 간격 추가
                children: [
                  Icon(CupertinoIcons.heart_circle_fill, size: 50, color: CupertinoColors.systemPink.withOpacity(0.9)),
                  Icon(CupertinoIcons.star_circle_fill, size: 50, color: CupertinoColors.systemYellow.withOpacity(0.9)),
                  Icon(CupertinoIcons.moon_circle_fill, size: 50, color: CupertinoColors.systemIndigo.withOpacity(0.9)),
                  Icon(CupertinoIcons.graph_circle_fill, size: 50, color: CupertinoColors.systemGreen.withOpacity(0.9)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
