// lib/widgets/camera/guide_overlay.dart

import 'package:flutter/cupertino.dart';

class GuideOverlay extends StatelessWidget {
  const GuideOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Elliptical border
        Positioned(
          top: 120, // Position of the ellipse
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 350, // Width of the ellipse
              height: 450, // Height of the ellipse
              decoration: BoxDecoration(
                border: Border.all(color: CupertinoColors.activeOrange, width: 4),
                borderRadius: BorderRadius.all(Radius.elliptical(300, 400)), // Adjusted for elliptical shape
              ),
            ),
          ),
        ),
        // Sticker image
        Positioned(
          top: 120, // Position of the sticker
          left: 20,
          right: 0,
          child: Center(
            child: Image.asset(
              'assets/images/sticker.png', // Path to the sticker image
              width: 400, // Width of the sticker
              height: 400, // Height of the sticker
            ),
          ),
        ),
        // Instructional text
        Positioned(
          top: 50, // Position of the text
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              "이곳에 변기를 맞춰주세요",
              style: const TextStyle(
                color: CupertinoColors.activeOrange,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
