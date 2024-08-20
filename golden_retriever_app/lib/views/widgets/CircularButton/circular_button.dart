


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onClick;

  const CircularButton({
    required this.color,
    required this.width,
    required this.height,
    required this.icon,
    required this.onClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(
        icon: icon,
        enableFeedback: true,
        onPressed: () => onClick(),
      ),
    );
  }
}



// 여기에 CircularButton - Floating Animation Button (FAB) 맹글기
// Positioned(
//   right: 30,
//   bottom: 30,
//   child: Stack(
//     alignment: Alignment.bottomRight,
//     children: <Widget>[
//       IgnorePointer(
//         child: Container(
//           color: Colors.transparent,
//           height: 150.0,
//           width: 150.0,
//         ),
//       ),
//       Transform.translate(
//         offset: Offset.fromDirection(
//             getRadiansFromDegree(270), degOneTranslationAnimation.value * 100),
//         child: Transform(
//           transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))
//             ..scale(degOneTranslationAnimation.value),
//           alignment: Alignment.center,
//           child: CircularButton(
//             color: Colors.blue,
//             width: 50,
//             height: 50,
//             icon: Icon(
//               Icons.person,  // 마이페이지
//               color: Colors.white,
//             ),
//             onClick: () {
//               print('MyPage');
//             },
//           ),
//         ),
//       ),
//       Transform.translate(
//         offset: Offset.fromDirection(
//             getRadiansFromDegree(225), degTwoTranslationAnimation.value * 100),
//         child: Transform(
//           transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))
//             ..scale(degTwoTranslationAnimation.value),
//           alignment: Alignment.center,
//           child: CircularButton(
//             color: Colors.black,
//             width: 50,
//             height: 50,
//             icon: Icon(
//               Icons.camera_alt,
//               color: Colors.white,
//             ),
//             onClick: () {
//               print('Camera');
//             },
//           ),
//         ),
//       ),
//       Transform.translate(
//         offset: Offset.fromDirection(
//             getRadiansFromDegree(180), degThreeTranslationAnimation.value * 100),
//         child: Transform(
//           transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))
//             ..scale(degThreeTranslationAnimation.value),
//           alignment: Alignment.center,
//           child: CircularButton(
//             color: Colors.orangeAccent,
//             width: 50,
//             height: 50,
//             icon: Icon(
//               Icons.calendar_month_rounded,
//               color: Colors.white,
//             ),
//             onClick: () {
//               print('Calendar');
//             },
//           ),
//         ),
//       ),
//       Transform(
//         transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value)),
//         alignment: Alignment.center,
//         child: CircularButton(
//           color: Colors.red,
//           width: 60,
//           height: 60,
//           icon: Icon(
//             Icons.menu,
//             color: Colors.white,
//           ),
//           onClick: () {
//             if (animationController.isCompleted) {
//               animationController.reverse();
//             } else {
//               animationController.forward();
//             }
//           },
//         ),
//       )
//     ],
//   ),
// )


