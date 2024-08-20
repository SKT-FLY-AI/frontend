// lib/views/screens/calendar_screen.dart

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/images_list.dart';
import '../../widgets/rive_background.dart';
import 'components/calendar_header.dart';
import 'components/calendar_grid.dart';
import '../../widgets/custom_bottom_navigation_bar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
    _updateSelectedDate(_selectedDate);
  }

  void _previousMonth() {
    setState(() {
      _focusedDate = DateTime(_focusedDate.year, _focusedDate.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _focusedDate = DateTime(_focusedDate.year, _focusedDate.month + 1);
    });
  }

  void _updateSelectedDate(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  /// 상단: 캘린더 위젯
  Widget _buildCalendar(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final calendarSize = constraints.maxWidth * 0.9;
        final calendarPadding = constraints.maxWidth * 0.05;

        return ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Container(
              width: calendarSize,
              margin: EdgeInsets.symmetric(horizontal: calendarPadding),
              padding: EdgeInsets.symmetric(horizontal: calendarPadding, vertical: calendarPadding),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3), // 더 부드러운 글래스모피즘 효과
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.white.withOpacity(0.4)), // 약간 더 강조된 테두리
              ),
              child: Column(
                children: [
                  CalendarHeader(
                    focusedDate: _focusedDate,
                    onLeftArrowTap: _previousMonth,
                    onRightArrowTap: _nextMonth,
                  ),
                  SizedBox(
                    height: calendarSize * 0.9, // 6-week calendar height
                    child: CalendarGrid(
                      focusedDate: _focusedDate,
                      selectedDate: _selectedDate,
                      onDateSelected: _updateSelectedDate,
                      imagesList: imagesList,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  /// 하단: 선택된 날짜의 세부 상태
  Widget _buildSelectedDateDetails(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.9;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Container(
          width: contextWidth,
          padding: EdgeInsets.all(contextHeight * 0.2),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6), // 반투명 배경색
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: Colors.white.withOpacity(0.4)), // 테두리
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: contextHeight * 0.1, horizontal: contextWidth * 0.01),
                child: Text(
                  _dateFormat.format(_selectedDate),
                  style: TextStyle(
                    fontSize: contextHeight * 0.23,
                    fontWeight: FontWeight.w500,
                    color: CupertinoColors.black,
                    decoration: TextDecoration.none, // 밑줄 제거
                  ),
                ),
              ),
              _buildHealthStatus(
                context,
                "아주 건강한 똥!",
                "Bristol 4\n색상: Brown, 혈변: X",
                CupertinoColors.activeBlue,
                Icons.celebration, // Example icon
              ),
              _buildHealthStatus(
                context,
                "진단이 필요해요.",
                "Bristol 6\n색상: Red, 혈변: O",
                CupertinoColors.systemRed,
                CupertinoIcons.exclamationmark_circle_fill, // Example icon
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHealthStatus(
      BuildContext context,
      String title,
      String subtitle,
      Color color,
      IconData icon, // Icon 추가
      ) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Container(
      width: contextWidth * 8, // 화면 너비에 기반한 고정된 너비
      padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.5, vertical: contextHeight * 0.1),
      margin: EdgeInsets.symmetric(vertical: contextHeight * 0.1),
      decoration: BoxDecoration(
        color: color.withOpacity(0.25), // 투명도 조정
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: contextWidth * 0.5),
            child: Icon(icon, color: color, size: contextHeight * 0.33), // Icon 추가
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: contextHeight * 0.18,
                    fontWeight: FontWeight.bold,
                    color: color,
                    decoration: TextDecoration.none, // 밑줄 제거
                  ),
                ),
                SizedBox(height: contextHeight * 0.1),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: contextHeight * 0.15,
                    color: color,
                    decoration: TextDecoration.none, // 밑줄 제거
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return CupertinoPageScaffold(
      child: Stack(
        children: [
          const RiveBackground(), // 애니메이션 배경 추가
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: contextHeight),
                _buildCalendar(context),
                SizedBox(height: contextHeight * 0.5),
                _buildSelectedDateDetails(context),
                SizedBox(height: contextHeight * 4),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBottomNavigationBar(
              currentIndex: 1, // 선택된 탭의 인덱스 설정
              onTap: (currentIndex) {
                // 네비게이션을 위한 핸들러 추가
              },
            ),
          ),
        ],
      ),
    );
  }
}
