// lib/widgets/camera_controls_widget.dart

// import 'package:flutter/cupertino.dart';

// class CameraControlsWidget extends StatelessWidget {
//   final VoidCallback onOpenGallery;
//   final VoidCallback onTakePicture;
//   final VoidCallback onToggleCamera;

//   const CameraControlsWidget({
//     Key? key,
//     required this.onOpenGallery,
//     required this.onTakePicture,
//     required this.onToggleCamera,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned(
//           bottom: 50.0, // 위치 조정
//           left: 16.0,
//           right: 16.0,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               CupertinoButton(
//                 child: const Icon(CupertinoIcons.photo, size: 28),
//                 onPressed: onOpenGallery,
//               ),
//               CupertinoButton(
//                 child: Container(
//                   width: 80,
//                   height: 80,
//                   decoration: BoxDecoration(
//                     color: CupertinoColors.activeOrange,
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Icon(
//                     CupertinoIcons.camera,
//                     size: 43,
//                     color: CupertinoColors.white,
//                   ),
//                 ),
//                 onPressed: onTakePicture,
//                 padding: EdgeInsets.zero, // 패딩 제거
//               ),
//               CupertinoButton(
//                 child: const Icon(CupertinoIcons.arrow_2_circlepath, size: 28),
//                 onPressed: onToggleCamera,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/cupertino.dart';

class CameraControlsWidget extends StatelessWidget {
  final VoidCallback onOpenGallery;
  final VoidCallback onTakePicture;
  final VoidCallback onToggleCamera;

  const CameraControlsWidget({
    Key? key,
    required this.onOpenGallery,
    required this.onTakePicture,
    required this.onToggleCamera,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 50.0, // 위치 조정
          left: 16.0,
          right: 16.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CupertinoButton(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    CupertinoIcons.photo,
                    size: 28,
                    color: CupertinoColors.white,
                  ),
                ),
                onPressed: onOpenGallery,
                padding: EdgeInsets.zero, // 패딩 제거
              ),
              CupertinoButton(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: CupertinoColors.activeOrange,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    CupertinoIcons.camera,
                    size: 40,
                    color: CupertinoColors.white,
                  ),
                ),
                onPressed: onTakePicture,
                padding: EdgeInsets.zero, // 패딩 제거
              ),
              CupertinoButton(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    CupertinoIcons.arrow_2_circlepath,
                    size: 28,
                    color: CupertinoColors.white,
                  ),
                ),
                onPressed: onToggleCamera,
                padding: EdgeInsets.zero, // 패딩 제거
              ),
            ],
          ),
        ),
      ],
    );
  }
}