// lib/views/screens/homeScreen/components/home_menu_box.dart

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../calendarScreen/calendar_screen.dart';
import '../../camera_screen.dart';
import '../../entertainment_screen.dart';
import '../../profile_screen.dart';

class HomeMenuBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const HomeMenuBox({
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: contextWidth * 4,
            height: contextWidth * 4,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
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
        ),
      ),
    );
  }
}


class HomeMenuBoxGrid extends StatelessWidget {
  final int itemCount;
  final String? username;

  HomeMenuBoxGrid({
    super.key,
    required this.itemCount,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    // final CupertinoTabController _tabController = CupertinoTabController();

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
              builder: (context) => ProfileScreen(username: username),
            ),
          );
        },
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: contextHeight * 0.1,
          horizontal: contextWidth * 0.6
      ), // 화면 크기에 따른 패딩
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
