// lib/screens/profile_screen.dart

import 'package:flutter/cupertino.dart';

class ProfileScreen extends StatelessWidget {
  final String title;
  final String content;

  const ProfileScreen({
    super.key,
    this.title = 'Profile',
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
