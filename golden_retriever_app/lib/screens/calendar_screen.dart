// lib/screens/calendar_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
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
  String _selectedDateInfo = "";
  String _selectedDateStatus = "";

  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
    _updateSelectedDateInfoAndStatus(_selectedDate);
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
      _updateSelectedDateInfoAndStatus(date);
    });
  }

  void _updateSelectedDateInfoAndStatus(DateTime date) {
    _selectedDateInfo = "Event for ${_dateFormat.format(date)}";
    _selectedDateStatus = "Status for ${_dateFormat.format(date)}";
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Calendar'),
      ),
      child: Column(
        children: [
          const SizedBox(height: 120),
          _buildCalendar(context),
          const SizedBox(height: 20),
          _buildInfoBoxes(),
        ],
      ),
    );
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

  Widget _buildInfoBoxes() {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              InfoBox(
                title: 'Chat Log',
                content: _selectedDateInfo,
              ),
              const SizedBox(height: 20),
              InfoBox(
                title: 'Status',
                content: _selectedDateStatus,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
