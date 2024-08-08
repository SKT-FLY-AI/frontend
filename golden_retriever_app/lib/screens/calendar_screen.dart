// lib/screens/calendar_screen.dart

import 'package:flutter/cupertino.dart';
import '../widgets/calendar_header.dart';
import '../widgets/calendar_grid.dart';
import '../widgets/info_box.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();
  String _selectedDateInfo = "No events"; // 선택한 날짜의 정보를 저장하는 변수
  String _selectedDateStatus = "No status"; // 선택한 날짜의 상태를 저장하는 변수

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Calendar'),
      ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 100), // 캘린더 상단의 여백을 조정
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey6,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.black.withOpacity(0.2),
                    blurRadius: 10.0,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CalendarHeader(
                    focusedDate: _focusedDate,
                    onLeftArrowTap: () {
                      setState(() {
                        _focusedDate = DateTime(_focusedDate.year, _focusedDate.month - 1);
                      });
                    },
                    onRightArrowTap: () {
                      setState(() {
                        _focusedDate = DateTime(_focusedDate.year, _focusedDate.month + 1);
                      });
                    },
                  ),
                  CalendarGrid(
                    focusedDate: _focusedDate,
                    selectedDate: _selectedDate,
                    onDateSelected: (date) {
                      setState(() {
                        _selectedDate = date;
                        _selectedDateInfo = "Event for $date"; // 임시 이벤트 정보
                        _selectedDateStatus = "Status for $date"; // 임시 상태 정보
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InfoBox(
                      title: 'Chat Log',
                      content: _selectedDateInfo,
                    ),
                    const SizedBox(height: 16.0),
                    InfoBox(
                      title: 'Status',
                      content: _selectedDateStatus,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}