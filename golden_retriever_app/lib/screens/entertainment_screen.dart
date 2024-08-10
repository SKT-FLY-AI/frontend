// lib/screens/entertainment_screen.dart

import 'package:flutter/cupertino.dart';

class EntertainmentScreen extends StatelessWidget {
  final String title;
  final String content;

  const EntertainmentScreen({
    super.key,
    this.title = 'Entertainment',
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
