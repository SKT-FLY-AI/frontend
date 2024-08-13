// lib/screens/calendar_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:golden_retriever_app/screens/status_screen.dart';
import 'package:intl/intl.dart';
import '../widgets/calendar/calendar_header.dart';
import '../widgets/calendar/calendar_grid.dart';
import '../widgets/calendar/info_box.dart';
import 'chatlog_screen.dart';

/// Main screen widget displaying a calendar with navigable months.
/// Users can select dates and view related information.
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

  /// Navigates to the previous month
  void _previousMonth() {
    setState(() {
      _focusedDate = DateTime(_focusedDate.year, _focusedDate.month - 1);
    });
  }

  /// Navigates to the next month
  void _nextMonth() {
    setState(() {
      _focusedDate = DateTime(_focusedDate.year, _focusedDate.month + 1);
    });
  }

  /// Updates the selected date and its associated information
  void _updateSelectedDate(DateTime date) {
    setState(() {
      _selectedDate = date;
      _updateSelectedDateInfoAndStatus(date);
    });
  }

  /// Updates the information and status for the selected date
  void _updateSelectedDateInfoAndStatus(DateTime date) {
    _selectedDateInfo = "Event for ${_dateFormat.format(date)}";
    _selectedDateStatus = "Status for ${_dateFormat.format(date)}";
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('캘린더'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildCalendar(context),
              const SizedBox(height: 50),
              Text(
                '${_dateFormat.format(_selectedDate)}',
                style: TextStyle(
                  fontSize: 18.0,                // Custom font size
                  fontWeight: FontWeight.bold,   // Custom font weight
                ),
                textAlign: TextAlign.center,     // Center-align the text
              ),
              const SizedBox(height: 20),
              _buildInfoBoxes(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the calendar view with month navigation and date selection
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

  /// Builds the information boxes displaying selected date's details
  Widget _buildInfoBoxes() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              // Navigate to ChatLogScreen when the Chat Log box is tapped
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => ChatLogScreen(date: _selectedDate)),
              );
            },
            child: InfoBox(
              title: '챗로그',
              content: _selectedDateInfo,
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              // Navigate to StatusScreen when the Status box is tapped
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => StatusScreen(date: _selectedDate)),
              );
            },
            child: InfoBox(
              title: '상태',
              content: _selectedDateStatus,
            ),
          ),
        ],
      ),
    );
  }
}
