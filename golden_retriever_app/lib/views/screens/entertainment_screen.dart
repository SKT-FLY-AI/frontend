// lib/screens/entertainment_screen.dart

import 'package:flutter/cupertino.dart';

class EntertainmentScreen extends StatelessWidget {
  final CupertinoTabController tabController;
  final String title;
  final String content;

  const EntertainmentScreen({
    super.key,
    required this.tabController,
    this.title = '엔터테인먼트',
    this.content = 'Entertainment Screen',
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
