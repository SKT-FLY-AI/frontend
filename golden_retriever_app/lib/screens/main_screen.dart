import 'package:flutter/cupertino.dart';
import 'calendar_screen.dart';
import 'capture_screen.dart';
import 'image_upload_screen.dart';

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
            icon: Icon(CupertinoIcons.chat_bubble),
            label: 'Chat',
          ),
        ],
        onTap: (index) {
          // 탭 변경 시 동작을 여기에 구현할 수 있습니다.
        },
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
              builder: (context) => const ImageUploadScreen(),
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
