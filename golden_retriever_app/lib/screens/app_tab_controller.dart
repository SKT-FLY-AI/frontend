// lib/screens/app_tab_controller.dart

import 'package:flutter/cupertino.dart';

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
        items: _buildTabBarItems(),
      ),
      tabBuilder: (context, index) {
        // Debugging: Log tab changes
        print("Selected tab index: $index");
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
          builder: (context) => HomeScreen(tabController: _tabController),
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
          builder: (context) => HomeScreen(tabController: _tabController),
        );
    }
  }
}
