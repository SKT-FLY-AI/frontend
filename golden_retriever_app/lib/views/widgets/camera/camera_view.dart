// lib/widgets/camera/camera_view.dart

import 'package:flutter/cupertino.dart';
import 'package:camera/camera.dart';
import 'camera_preview_widget.dart';
import 'camera_controls_widget.dart';

class CameraView extends StatelessWidget {
  final CameraController controller;
  final VoidCallback onOpenGallery;
  final VoidCallback onTakePicture;
  final VoidCallback onToggleCamera;

  const CameraView({
    super.key,
    required this.controller,
    required this.onOpenGallery,
    required this.onTakePicture,
    required this.onToggleCamera,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildCameraPreview(),
        _buildCameraControls(),
      ],
    );
  }

  Widget _buildCameraPreview() {
    return CameraPreviewWidget(controller: controller);
  }

  Widget _buildCameraControls() {
    return CameraControlsWidget(
      onOpenGallery: onOpenGallery,
      onTakePicture: onTakePicture,
      onToggleCamera: onToggleCamera,
    );
  }
}
