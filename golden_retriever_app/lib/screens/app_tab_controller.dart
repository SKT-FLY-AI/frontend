// lib/screens/app_tab_controller.dart

import 'package:flutter/cupertino.dart';
import '../services/auth_service/login_service.dart';

import 'home_screen.dart';
import 'calendar_screen.dart';
import 'camera_screen.dart';
import 'entertainment_screen.dart';
import 'profile_screen.dart';

class AppTabController extends StatefulWidget {
  const AppTabController({super.key});

  @override
  State<AppTabController> createState() => _AppTabControllerState();
}

class _AppTabControllerState extends State<AppTabController> {
  final CupertinoTabController _tabController = CupertinoTabController();
  String? _username;

  @override
  void initState() {
    super.initState();
    _fetchUsername();
  }

  Future<void> _fetchUsername() async {
    // Fetch the username from secure storage using the LoginService
    final username = await LoginService.getUsername();
    setState(() {
      _username = username;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_username == null) {
      // While the username is being fetched, show a loading spinner
      return const CupertinoPageScaffold(
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    }

    return CupertinoTabScaffold(
      controller: _tabController,
      tabBar: CupertinoTabBar(
        items: _buildTabBarItems(),
        iconSize: 28.0, // 아이콘 크기 조정
        height: 50.0, // 탭바 위쪽 패딩 추가
      ),
      tabBuilder: (context, index) {
        // Debugging: Log tab changes
        debugPrint("Selected tab index: $index");
        return _buildTabContent(index);
      },
    );
  }

  List<BottomNavigationBarItem> _buildTabBarItems() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.calendar),
        label: 'Calendar',
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.camera),
        label: 'Camera',
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.play_arrow_solid),
        label: 'Entertainment',
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.person),
        label: 'Profile',
      ),
    ];
  }

  Widget _buildTabContent(int index) {
    switch (index) {
      case 0:
        return CupertinoTabView(
          builder: (context) => HomeScreen(
            tabController: _tabController,
            username: _username!, // Pass the retrieved username here
          ),
        );
      case 1:
        return CupertinoTabView(
          builder: (context) => CalendarScreen(),
        );
      case 2:
        return CupertinoTabView(
          builder: (context) => CameraScreen(tabController: _tabController),
        );
      case 3:
        return CupertinoTabView(
          builder: (context) => EntertainmentScreen(),
        );
      case 4:
        return CupertinoTabView(
          builder: (context) => ProfileScreen(),
        );
      default:
      // Fallback to HomeScreen, although this should never be reached.
        return CupertinoTabView(
          builder: (context) => HomeScreen(
            tabController: _tabController,
            username: _username!,
          ),
        );
    }
  }
}
