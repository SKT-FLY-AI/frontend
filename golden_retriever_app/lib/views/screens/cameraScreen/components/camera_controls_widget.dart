// lib/widgets/camera/camera_controls_widget.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return Stack(
      children: [
        Positioned(
          bottom: contextHeight * 0.4,
          left: contextHeight * 0.3,
          right: contextHeight * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildControlButton(
                icon: CupertinoIcons.photo,
                size: 28,
                onPressed: onOpenGallery,
              ),
              _buildControlButton(
                icon: CupertinoIcons.camera,
                size: contextHeight * 0.55,
                onPressed: onTakePicture,
                isMainButton: true,
              ),
              _buildControlButton(
                icon: CupertinoIcons.arrow_2_circlepath,
                size: 28,
                onPressed: onToggleCamera,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required double size,
    required VoidCallback onPressed,
    bool isMainButton = false,
  }) {
    return CupertinoButton(
      child: Container(
        width: isMainButton ? 80 : 50,
        height: isMainButton ? 80 : 50,
        decoration: BoxDecoration(
          color: isMainButton
              ? Colors.orange.withOpacity(0.9)
              : Colors.grey.withOpacity(0.9),
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withOpacity(0.5),
            width: 0.8,
          ),
        ),
        child: Icon(
          icon,
          size: size,
          color: CupertinoColors.white,
        ),
      ),
      onPressed: onPressed,
      padding: EdgeInsets.zero,
    );
  }
}
