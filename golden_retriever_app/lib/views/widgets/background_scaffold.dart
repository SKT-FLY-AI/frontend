// lib/widgets/background_scaffold.dart

import 'package:flutter/cupertino.dart';

class BackgroundScaffold extends StatelessWidget {
  final Widget child;
  final String backgroundImagePath;

  const BackgroundScaffold({
    super.key,
    required this.child,
    this.backgroundImagePath = 'assets/images/background_image_sample.png',
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          // 배경 이미지 설정
          Positioned.fill(
            child: Image.asset(
              backgroundImagePath,
              fit: BoxFit.cover,
            ),
          ),
          // 페이지별로 전달된 child 위젯을 여기에 배치
          child,
        ],
      ),
    );
  }
}
