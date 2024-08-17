/// lib/views/widgets/navigation_camera_button.dart

import 'package:flutter/cupertino.dart';
import '../screens/camera_screen.dart';

/// 중앙에 위치한 카메라 버튼 위젯
class CameraButton extends StatelessWidget {
  final CupertinoTabController _tabController = CupertinoTabController();

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width * 0.4;

    return CupertinoButton(
      padding: EdgeInsets.only(bottom: size * 0.15),
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.activeOrange,
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(size * 0.1),
        child: Icon(
          CupertinoIcons.camera,
          color: CupertinoColors.white,
          size: size * 0.25,
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
          builder: (context) => CameraScreen(tabController: _tabController),
          ),
        );
      },
    );
  }
}
