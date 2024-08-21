// lib/widgets/camera/guide_overlay.dart

import 'package:flutter/cupertino.dart';

class GuideOverlay extends StatelessWidget {
  const GuideOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Stack(
      children: [
        // Elliptical border
        Positioned(
          top: contextHeight * 1.5, // Position of the ellipse
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: contextWidth * 8, // Width of the ellipse
              height: contextHeight * 5, // Height of the ellipse
              decoration: BoxDecoration(
                border: Border.all(color: CupertinoColors.activeOrange, width: 4),
                borderRadius: BorderRadius.all(Radius.elliptical(300, 400)), // Adjusted for elliptical shape
              ),
            ),
          ),
        ),
        // Sticker image
        Positioned(
          top: contextHeight * 1.5, // Position of the sticker
          left: contextWidth * 0.4,
          right: 0,
          child: Center(
            child: Image.asset(
              'assets/images/sticker.png', // Path to the sticker image
              width: contextWidth * 10, // Width of the sticker
              // height: 400, // Height of the sticker
            ),
          ),
        ),
        // Instructional text
        Positioned(
          top: contextHeight * 0.7, // Position of the text
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              "이곳에 변기를 맞춰주세요",
              style: TextStyle(
                color: CupertinoColors.activeOrange,
                fontSize: contextWidth * 0.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
