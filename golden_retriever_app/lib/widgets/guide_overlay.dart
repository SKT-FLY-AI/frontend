// lib/widegets/guide_overlay.dart

// import 'package:flutter/cupertino.dart';

// class GuideOverlay extends StatelessWidget {
//   const GuideOverlay({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 130, // 원하는 높이로 조정
//       left: 0,
//       right: 0,
//       child: Center(
//         child: Container(
//           width: 350, // 타원의 너비
//           height: 450, // 타원의 높이
//           decoration: BoxDecoration(
//             border: Border.all(color: CupertinoColors.activeOrange, width: 2),
//             borderRadius: BorderRadius.all(Radius.elliptical(300, 400)), // 타원 모양을 위해 반지름 값을 조정
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';

class GuideOverlay extends StatelessWidget {
  const GuideOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 70, // 원하는 높이로 조정
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              "이곳에 변기를 맞춰주세요",
              style: TextStyle(
                color: CupertinoColors.activeOrange,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
          top: 130, // 원하는 높이로 조정
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 350, // 타원의 너비
              height: 450, // 타원의 높이
              decoration: BoxDecoration(
                border: Border.all(color: CupertinoColors.activeOrange, width: 4),
                borderRadius: BorderRadius.all(Radius.elliptical(300, 400)), // 타원 모양을 위해 반지름 값을 조정
              ),
            ),
          ),
        ),
      ],
    );
  }
}