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
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        width: contextWidth * 4,
        height: contextWidth * 4,
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey.withOpacity(0.7),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: contextHeight * 0.6, color: CupertinoColors.white),
            SizedBox(height: contextHeight * 0.05),
            Text(
              label,
              style: TextStyle(
                  fontSize: contextHeight * 0.2,
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

  HomeMenuBoxGrid({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final CupertinoTabController _tabController = CupertinoTabController();

    final List<HomeMenuBox> children = [
      HomeMenuBox(
        icon: CupertinoIcons.calendar,
        label: '캘린더',
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
            builder: (context) => CalendarScreen(tabController: _tabController),
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
              builder: (context) => CameraScreen(),
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
              builder: (context) => EntertainmentScreen(tabController: _tabController),
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
              builder: (context) => ProfileScreen(tabController: _tabController),
            ),
          );
        },
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: contextHeight * 0.1, horizontal: contextWidth * 0.6), // 화면 크기에 따른 패딩
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
