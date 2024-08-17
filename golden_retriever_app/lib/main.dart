// lib/main.dart

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/cupertino.dart';
import 'views/screens/login_screen.dart';

void main() {
  // 스플래시 화면 설정
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MyApp());

  FlutterNativeSplash.remove();
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
