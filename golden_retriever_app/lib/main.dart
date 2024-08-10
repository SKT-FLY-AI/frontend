// lib/main.dart

import 'package:flutter/cupertino.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: _buildTheme(),
      home: const LoginScreen(),
    );
  }

  CupertinoThemeData _buildTheme() {
    return const CupertinoThemeData(
      primaryColor: CupertinoColors.activeOrange,
    );
  }
}
