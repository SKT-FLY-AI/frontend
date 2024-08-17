// lib/views/screens/calendar_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../widgets/calendar/calendar_header.dart';
import '../widgets/calendar/calendar_grid.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/navigation_camera_button.dart';

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

  Widget _buildCalendar(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final calendarSize = constraints.maxWidth - 32.0;

        return Container(
          width: calendarSize,
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey6,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              CalendarHeader(
                focusedDate: _focusedDate,
                onLeftArrowTap: _previousMonth,
                onRightArrowTap: _nextMonth,
              ),
              SizedBox(
                height: calendarSize * 6 / 7, // 6-week calendar height
                child: CalendarGrid(
                  focusedDate: _focusedDate,
                  selectedDate: _selectedDate,
                  onDateSelected: _updateSelectedDate,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width * 0.4;

    return CupertinoPageScaffold(
      child: Stack(
        children: [ // 이 부분을 수정
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size * 0.8),
                _buildCalendar(context),
                SizedBox(height: size * 0.6),
                Text(
                  'selected date: ${_dateFormat.format(_selectedDate)}',
                  style: TextStyle(
                    fontSize: 18.0, // Custom font size
                  ),
                  textAlign: TextAlign.center, // Center-align the text
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
          // 하단바
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavigationBar(),
          ),
          // 중앙의 카메라 버튼
          Align(
            alignment: Alignment.bottomCenter,
            child: CameraButton(),
          ),
        ],
      ),
    );
  }
}
