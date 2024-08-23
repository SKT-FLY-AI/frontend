// lib/views/screens/homeScreen/components/today_dog_status.dart
import 'package:flutter/material.dart';

class TodayDogStatus extends StatelessWidget {
  final double height;
  final double width;
  final String? dogName; // dogName이 null이 될 수 있도록 설정

  const TodayDogStatus({
    Key? key,
    required this.height,
    required this.width,
    this.dogName, // null 허용
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayText = (dogName == null || dogName!.isEmpty)
        ? "강아지 추가하기"
        : "$dogName의 오늘 상태";

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.3), // 반투명 배경색
        borderRadius: BorderRadius.circular(16.0), // 모서리 둥글게
        border: Border.all(
          color: Colors.white.withOpacity(0.5), // 테두리 색상
          width: 1.0,
        ),
      ),
      child: Center(
        child: Text(
          displayText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14, // 글씨 크기 설정
            fontWeight: FontWeight.normal, // 글씨 굵기를 normal로 설정
            decoration: TextDecoration.none, // 밑줄 제거
          ),
        ),
      ),
    );
  }
}
