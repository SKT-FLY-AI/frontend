// lib/widgets/camera_top_bar.dart

import 'package:flutter/cupertino.dart';

class CameraTopBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;

  const CameraTopBar({
    super.key,
    this.title = 'Camera',
    this.backgroundColor = CupertinoColors.black,
    this.textColor = CupertinoColors.white,
    this.iconColor = CupertinoColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: backgroundColor,
      middle: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      leading: CupertinoButton(
        padding: EdgeInsets.zero,
        child: Icon(CupertinoIcons.back, color: iconColor),
        onPressed: () {
          Navigator.pop(context); // 이전 페이지로 이동
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44.0);

  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}
