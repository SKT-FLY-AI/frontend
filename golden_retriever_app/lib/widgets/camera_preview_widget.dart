// camera_preview_widget.dart

// import 'package:flutter/cupertino.dart';
// import 'package:camera/camera.dart';

// class CameraPreviewWidget extends StatelessWidget {
//   final CameraController controller;

//   const CameraPreviewWidget({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Positioned.fill(
//       child: AspectRatio(
//         aspectRatio: controller.value.aspectRatio,
//         child: CameraPreview(controller),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:camera/camera.dart';
import 'guide_overlay.dart';

class CameraPreviewWidget extends StatelessWidget {
  final CameraController controller;

  const CameraPreviewWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: CameraPreview(controller),
          ),
        ),
        const GuideOverlay(), // 가이드라인 추가
      ],
    );
  }
}