// lib/screens/profile_screen.dart

import 'package:flutter/cupertino.dart';

class ProfileScreen extends StatelessWidget {
  final CupertinoTabController tabController;
  final String title;
  final String content;

  const ProfileScreen({
    super.key,
    required this.tabController,
    this.title = '내 정보',
    this.content = 'Profile Screen',
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      child: Center(
        child: Text(content),
      ),
    );
  }
}
