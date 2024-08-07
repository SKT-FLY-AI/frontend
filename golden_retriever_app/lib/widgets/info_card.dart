// lib/widgets/info_card.dart
import 'package:flutter/cupertino.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String detail;

  const InfoCard({super.key, required this.title, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6, // 카드 배경색
        borderRadius: BorderRadius.circular(12.0), // 둥근 모서리
        boxShadow: const [
          BoxShadow(
            color: CupertinoColors.systemGrey3,
            blurRadius: 6,
            offset: Offset(0, 4), // 그림자 위치 조정
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(detail),
        ],
      ),
    );
  }
}
