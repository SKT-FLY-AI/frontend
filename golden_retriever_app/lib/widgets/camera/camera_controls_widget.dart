// lib/widgets/camera/camera_controls_widget.dart

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
          bottom: 50.0,
          left: 16.0,
          right: 16.0,
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
                size: 40,
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
              ? CupertinoColors.activeOrange
              : CupertinoColors.systemGrey,
          shape: BoxShape.circle,
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
