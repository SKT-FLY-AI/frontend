// lib/views/widgets/home/home_menu_box.dart

import 'package:flutter/cupertino.dart';

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
    final double size = MediaQuery.of(context).size.width * 0.4;

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey.withOpacity(0.5),
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

  const HomeMenuBoxGrid({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width * 0.4;

    final List<HomeMenuBox> children = [
      HomeMenuBox(
        icon: CupertinoIcons.calendar,
        label: '캘린더',
        onPressed: () {
          // 캘린더 화면으로 이동
        },
      ),
      HomeMenuBox(
        icon: CupertinoIcons.camera,
        label: '카메라',
        onPressed: () {
          // 카메라 화면으로 이동
        },
      ),
      HomeMenuBox(
        icon: CupertinoIcons.game_controller,
        label: '엔터테인먼트',
        onPressed: () {
          // 엔터테인먼트 화면으로 이동
        },
      ),
      HomeMenuBox(
        icon: CupertinoIcons.person,
        label: '내 정보',
        onPressed: () {
          // 내 정보 화면으로 이동
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
