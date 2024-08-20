// lib/views/screens/homeScreen/components/weekly_badge_widget.dart

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BadgeBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildGlassyContainer(
      context: context,
      title: '뱃지 현황',
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildIconWithEffects(
                icon: CupertinoIcons.heart_circle_fill,
                color: CupertinoColors.systemPink.withOpacity(0.9)
            ),
            _buildIconWithEffects(
                icon: CupertinoIcons.star_circle_fill,
                color: CupertinoColors.systemYellow.withOpacity(0.9)
            ),
            _buildIconWithEffects(
                icon: CupertinoIcons.moon_circle_fill,
                color: CupertinoColors.systemIndigo.withOpacity(0.9)
            ),
            _buildIconWithEffects(
                icon: CupertinoIcons.graph_circle_fill,
                color: CupertinoColors.systemGreen.withOpacity(0.9)
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIconWithEffects({required IconData icon, required Color color}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: color.withOpacity(0.7), // 테두리 색상
          width: 3, // 테두리 두께
        ),
      ),
      child: Icon(
        icon,
        size: 50,
        color: color,
      ),
    );
  }
}

class WeeklyProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildGlassyContainer(
      context: context,
      title: '이번 주',
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(7, (index) {
            const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
            return Text(
              days[index],
              style: _titleTextStyle(context),
            );
          }),
        ),
        SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(7, (index) {
            return Icon(
              CupertinoIcons.drop_fill,
              size: 35,
              color: CupertinoColors.systemBrown,
            );
          }),
        ),
      ],
    );
  }
}

// 글래스모피즘 컨테이너를 구성하는 함수
Widget _buildGlassyContainer({
  required BuildContext context,
  required String title,
  required List<Widget> children, // Widget 리스트로 받음
}) {
  final double contextHeight = MediaQuery.of(context).size.height * 0.1;
  final double contextWidth = MediaQuery.of(context).size.width * 0.1;

  return Padding(
    padding: EdgeInsets.symmetric(vertical: contextHeight * 0.1, horizontal: contextWidth * 0.6),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3), // 반투명 배경색
            borderRadius: BorderRadius.circular(16.0), // 모서리 둥글게
            border: Border.all(
              color: Colors.white.withOpacity(0.5), // 테두리 색상
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: _titleTextStyle(context),
                ),
                SizedBox(height: 18.0),
                ...children, // 전달받은 Widget 리스트를 펼쳐서 배치
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

// 타이틀 텍스트 스타일을 정의하는 함수
TextStyle _titleTextStyle(BuildContext context) {
  return TextStyle(
    color: CupertinoColors.white,
    fontSize: MediaQuery.of(context).size.height * 0.018, // 타이틀 크기를 동적으로 설정
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  );
}
