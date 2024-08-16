// lib/widgets/camera/camera_preview_widget.dart

import 'package:flutter/cupertino.dart';
import 'package:camera/camera.dart';
import 'guide_overlay.dart';

class CameraPreviewWidget extends StatelessWidget {
  final CameraController controller;
  final Widget? overlay;  // Allows for custom overlays

  const CameraPreviewWidget({
    Key? key,
    required this.controller,
    this.overlay = const GuideOverlay(), // Default to GuideOverlay
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
        if (overlay != null) overlay!, // Display the overlay if provided
      ],
    );
  }
}
