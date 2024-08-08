// lib/widgets/camera_top_bar.dart

import 'package:flutter/cupertino.dart';

class CameraTopBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  final CupertinoTabController tabController;

  const CameraTopBar({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: CupertinoColors.black,
      middle: const Text(
        'Camera',
        style: TextStyle(color: CupertinoColors.white),
      ),
      leading: CupertinoButton(
        padding: EdgeInsets.zero,
        child: const Icon(CupertinoIcons.back, color: CupertinoColors.white),
        onPressed: () {
          tabController.index = 0; // 홈 탭으로 돌아가기
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44.0);

  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}