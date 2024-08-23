// lib/views/screens/homeScreen/home_screen.dart

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../expandable_fab.dart';
import '../../rive_background.dart';
import 'components/chatlog_widget.dart';
import 'components/cardnews_box.dart';
import 'components/greeting_message.dart';
import 'components/weekly_badge_widget.dart';
import 'components/today_dog_status.dart'; // 새로 만든 파일을 import

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _dogName;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _loadDogName();
  }

  Future<void> _loadDogName() async {
    final dogName = await _storage.read(key: 'dog_name');

    print('저장된 강아지 이름(원본): $dogName');

    if (dogName != null) {
      try {
        // UTF-8 디코딩 시도
        final decodedName = utf8.decode(dogName.runes.toList());
        print('디코딩된 강아지 이름: $decodedName');
        setState(() {
          _dogName = decodedName;
        });
      } catch (e) {
        // 디코딩에 실패했을 경우
        print('디코딩 실패: $e');
        setState(() {
          _dogName = dogName;
        });
      }
    } else {
      setState(() {
        _dogName = '강아지'; // 기본값 설정
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return CupertinoPageScaffold(
      child: Stack(
        children: [
          const RiveBackground(), // 애니메이션 배경 추가
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GreetingMessage(dogName: _dogName ?? '강아지'), // 강아지 이름이 없을 경우 기본 값으로 '강아지'를 사용
                  TodayDogStatus(
                    height: contextHeight * 2.7,
                    width: contextWidth * 9,
                    dogName: _dogName ?? '강아지 추가하기', // 강아지 이름 전달
                  ), // 새로 만든 위젯을 사용
                  ChatlogWidgetColumn(itemCount: 1), // 카메라 버튼
                  SizedBox(height: contextHeight * 0.2),
                  BadgeBox(), // 배지 박스 위젯
                  CardNewsBox(), // 카드 뉴스 위젯
                  ChatlogWidgetColumn(itemCount: 3),
                  SizedBox(height: contextHeight * 2),
                ],
              ),
            ),
          ),
          const GlobalExpandableFab(), // GlobalExpandableFab 추가
        ],
      ),
    );
  }
}
