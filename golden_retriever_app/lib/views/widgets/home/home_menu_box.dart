// lib/views/widgets/home/home_menu_box.dart

import 'package:flutter/cupertino.dart';

import '../../screens/calendar_screen.dart';
import '../../screens/camera_screen.dart';
import '../../screens/entertainment_screen.dart';
import '../../screens/profile_screen.dart';

class HomeMenuBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  HomeMenuBox({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width * 0.4;

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey.withOpacity(0.7),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: size * 0.25, color: CupertinoColors.white),
            SizedBox(height: size * 0.05),
            Text(
              label,
              style: TextStyle(
                  fontSize: size * 0.1,
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeMenuBoxGrid extends StatelessWidget {
  final int itemCount;
  final CupertinoTabController _tabController = CupertinoTabController();

  HomeMenuBoxGrid({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width * 0.4;

    final List<HomeMenuBox> children = [
      HomeMenuBox(
        icon: CupertinoIcons.calendar,
        label: '캘린더',
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
            builder: (context) => CalendarScreen(),
            ),
          );
        },
      ),
      HomeMenuBox(
        icon: CupertinoIcons.camera,
        label: '카메라',
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => CameraScreen(tabController: _tabController),
            ),
          );
        },
      ),
      HomeMenuBox(
        icon: CupertinoIcons.game_controller,
        label: '엔터테인먼트',
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => EntertainmentScreen(),
            ),
          );
        },
      ),
      HomeMenuBox(
        icon: CupertinoIcons.person,
        label: '내 정보',
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => ProfileScreen(),
            ),
          );
        },
      ),
    ];

    return Padding(
      padding: EdgeInsets.all(size * 0.15), // 화면 크기에 따른 패딩
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: 1, // 정사각형 비율 유지
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return HomeMenuBox(
            icon: children[index].icon,
            label: children[index].label,
            onPressed: children[index].onPressed,
          );
        },
      ),
    );
  }
}
