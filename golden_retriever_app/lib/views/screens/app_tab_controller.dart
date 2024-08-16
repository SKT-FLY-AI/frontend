// lib/views/screens/app_tab_controller.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'home_screen.dart';
import 'calendar_screen.dart';
import 'camera_screen.dart';
import 'entertainment_screen.dart';
import 'profile_screen.dart';

/// StatefulWidget을 상속받아, 상태가 변할 수 있는 위젯을 만듦
class AppTabController extends StatefulWidget {
  const AppTabController({super.key});

  @override
  State<AppTabController> createState() => _AppTabControllerState();
}  // createState 메서드는 위젯의 상태를 관리하는 State 객체를 반환

/// State<AppTabController>를 상속받아 AppTabController 위젯의 상태를 정의
/// 클래스 이름 앞의 _는 이 클래스가 private임을 나타내며, 이 파일 내에서만 접근이 가능함을 의미
class _AppTabControllerState extends State<AppTabController> {
  final CupertinoTabController _tabController = CupertinoTabController();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  String? _username;

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    try {
      // 저장된 사용자 이름을 FlutterSecureStorage에서 가져오기
      final username = await _storage.read(key: 'username');
      if (username != null) {
        setState(() {
          _username = username;
        });
        print('사용자 이름 로드 성공: $username');
      } else {
        setState(() {
          _username = '';
        });
        print('사용자 이름 로드 실패: username이 null입니다.');
      }
    } catch (e) {
      setState(() {
        _username = '';
      });
      print('사용자 이름 로드 도중 에러 발생: $e');
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_username == null) {
      // 사용자 이름을 아직 불러오지 않은 경우 로딩 스피너 표시
      return const CupertinoPageScaffold(
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    }

    if (_username!.isEmpty) {
      // 사용자 이름이 비어있는 경우 기본 화면을 보여주거나, 오류 메시지를 표시할 수 있음
      return const CupertinoPageScaffold(
        child: Center(
          child: Text('Failed to load username'),
        ),
      );
    }

    return CupertinoTabScaffold(
      controller: _tabController,
      tabBar: CupertinoTabBar(
        items: _buildTabBarItems(),
        iconSize: 28.0,
        height: 50.0,
      ),
      tabBuilder: (context, index) {
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
            username: _username!,
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
        return CupertinoTabView(
          builder: (context) => HomeScreen(
            tabController: _tabController,
            username: _username!,
          ),
        );
    }
  }
}
