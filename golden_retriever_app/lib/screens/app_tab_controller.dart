// lib/screens/app_tab_controller.dart

import 'package:flutter/cupertino.dart';
import 'home_screen.dart';
import 'calendar_screen.dart';
import 'camera_screen.dart';
import 'entertainment_screen.dart';
import 'profile_screen.dart';
import '../services/auth_service/auth_service.dart';

class AppTabController extends StatefulWidget {
  const AppTabController({super.key});

  @override
  State<AppTabController> createState() => _AppTabControllerState();
}

class _AppTabControllerState extends State<AppTabController> {
  final CupertinoTabController _tabController = CupertinoTabController();
  String _username = 'Guest';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final fetchedUsername = await AuthService.getUsername();
    setState(() {
      _username = fetchedUsername ?? 'Guest';
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: _tabController,
      tabBar: CupertinoTabBar(
        items: _tabBarItems,
      ),
      tabBuilder: (context, index) {
        return _buildTabContent(index);
      },
    );
  }

  List<BottomNavigationBarItem> get _tabBarItems => const [
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

  Widget _buildTabContent(int index) {
    switch (index) {
      case 0:
        return CupertinoTabView(
          builder: (context) => HomeScreen(
            tabController: _tabController,
            username: _username,
          ),
        );
      case 1:
        return CupertinoTabView(
          builder: (context) => const CalendarScreen(),
        );
      case 2:
        return CupertinoTabView(
          builder: (context) => CameraScreen(tabController: _tabController),
        );
      case 3:
        return CupertinoTabView(
          builder: (context) => const EntertainmentScreen(),
        );
      case 4:
        return CupertinoTabView(
          builder: (context) => const ProfileScreen(),
        );
      default:
        return CupertinoTabView(
          builder: (context) => HomeScreen(
            tabController: _tabController,
            username: _username,
          ),
        );
    }
  }
}
