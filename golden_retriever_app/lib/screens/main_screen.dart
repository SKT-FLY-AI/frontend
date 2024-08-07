// main_screen.dart
import 'package:flutter/cupertino.dart';
import 'calendar_screen.dart';
import 'capture_screen.dart';
import 'entertainment_screen.dart';
import 'profile_screen.dart'; // 추가

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
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
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) => const Center(child: Text('Home')),
            );
          case 1:
            return CupertinoTabView(
              builder: (context) => const CalendarScreen(),
            );
          case 2:
            return CupertinoTabView(
              builder: (context) => const CaptureScreen(),
            );
          case 3:
            return CupertinoTabView(
              builder: (context) => const EntertainmentScreen(),
            );
          case 4:
            return CupertinoTabView(
              builder: (context) => const ProfileScreen(), // 내정보 화면 연결
            );
          default:
            return CupertinoTabView(
              builder: (context) => const Center(child: Text('Home')),
            );
        }
      },
    );
  }
}
