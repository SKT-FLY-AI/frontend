/// lib/views/widgets/custom_bottom_navigation_bar.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../screens/calendar_screen.dart';
import '../screens/entertainment_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';

/// 하단바를 구현한 위젯
class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 1;
  String? _username;
  final CupertinoTabController _tabController = CupertinoTabController();
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

  void _onTabTapped(int index) {
    if (index != 2) { // 가운데 비어있는 탭을 제외한 다른 탭을 선택했을 때
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  List<BottomNavigationBarItem> _buildTabBarItems() {
    return const [
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
    final List<Widget> _tabs = [
      HomeScreen(username: _username),
      CalendarScreen(tabController: _tabController),
      Placeholder(), // 가운데 빈 탭
      EntertainmentScreen(tabController: _tabController),
      ProfileScreen(tabController: _tabController),
    ];

    return CupertinoTabScaffold(
      controller: _tabController,
      tabBar: CupertinoTabBar(
        backgroundColor: CupertinoColors.systemGrey6,
        items: _buildTabBarItems(),
        onTap: _onTabTapped,
        currentIndex: _selectedIndex,
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return _tabs[_selectedIndex];
          },
        );
      },
    );
  }
}
