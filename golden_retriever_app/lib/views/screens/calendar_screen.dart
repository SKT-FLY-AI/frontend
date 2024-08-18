// lib/views/screens/calendar_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../widgets/calendar/calendar_header.dart';
import '../widgets/calendar/calendar_grid.dart';

class CalendarScreen extends StatefulWidget {
  final CupertinoTabController tabController;

  const CalendarScreen({
    super.key,
    required this.tabController,
  });

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
        final calendarSize = constraints.maxWidth * 0.9;
        final calendarPadding = constraints.maxWidth * 0.05;

        return Container(
          width: calendarSize,
          margin: EdgeInsets.symmetric(horizontal: calendarPadding),
          padding: EdgeInsets.all(calendarPadding),
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
                height: calendarSize * (6 / 7), // 6-week calendar height
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
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                 SizedBox(height: size * 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
