// lib/widgets/camera_top_bar.dart

import 'package:flutter/cupertino.dart';

class CameraTopBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  final CupertinoTabController tabController;
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;

  const CameraTopBar({
    Key? key,
    required this.tabController,
    this.title = 'Camera',
    this.backgroundColor = CupertinoColors.black,
    this.textColor = CupertinoColors.white,
    this.iconColor = CupertinoColors.white,
  }) : super(key: key);

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
          tabController.index = 0; // Navigate back to the home tab
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44.0);

  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}
