/// lib/views/widgets/custom_bottom_navigation_bar.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../screens/calendar_screen.dart';
import '../screens/camera_screen.dart';
import '../screens/entertainment_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';

/// 하단바를 구현한 위젯
class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  String? _username;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final username = await _storage.read(key: 'username');
    setState(() {  // UI 갱신
      _username = username;
    });
  }

  void _onCameraButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => CameraScreen(),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildTabBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        label: '홈',
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.calendar),
        label: '캘린더',
      ),
      BottomNavigationBarItem(
        icon: SizedBox.shrink(),  // 가운데를 비우기 위해 빈 위젯 사용
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.game_controller),
        label: '엔터테인먼트',
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.person),
        label: '내 정보',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return Stack(
      clipBehavior: Clip.none,  // 이 속성을 추가하여 잘림 방지
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          color: CupertinoColors.systemGrey6, // 원하는 색상 지정
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10.0),
            child: CupertinoTabBar(
              backgroundColor: CupertinoColors.systemGrey6,
              items: _buildTabBarItems(),
              onTap: widget.onTap,
              currentIndex: widget.currentIndex,
              iconSize: 35.0,
              border: Border(top: BorderSide(color: CupertinoColors.systemGrey6)),
            ),
          ),
        ),
        Positioned(
          bottom: contextHeight * 0.4,
          child: CupertinoButton(
            onPressed: () => _onCameraButtonPressed(context),
            padding: EdgeInsets.zero,
            child: Container(
              decoration: BoxDecoration(
                color: CupertinoColors.activeOrange,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(contextHeight * 0.15),
              child: Icon(
                CupertinoIcons.camera,
                color: CupertinoColors.white,
                size: contextHeight * 0.55,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
