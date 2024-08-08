// lib/screens/home_screen.dart
import 'package:flutter/cupertino.dart';
import 'calendar_screen.dart';
import 'capture_screen.dart';
import 'entertainment_screen.dart';
import 'profile_screen.dart';
import '../widgets/info_card.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
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
              builder: (context) => HomeScreen(tabController: _tabController),
            );
          case 1:
            return CupertinoTabView(
              builder: (context) => const CalendarScreen(),
            );
          case 2:
            return CupertinoTabView(
              builder: (context) => CaptureScreen(tabController: _tabController),
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
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  final CupertinoTabController tabController;

  const HomeScreen({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '절세미인님, 좋은 아침입니다!',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 50, // 예를 들어 50개의 아이템을 무한 스크롤로 보여줌
              itemBuilder: (context, index) {
                return InfoCard(
                  title: 'Title $index',
                  detail: 'Detail for item $index',
                );
              },
            ),
          ),
          CupertinoButton(
            child: const Icon(CupertinoIcons.camera, size: 36),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => CaptureScreen(tabController: tabController), // tabController 전달
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}