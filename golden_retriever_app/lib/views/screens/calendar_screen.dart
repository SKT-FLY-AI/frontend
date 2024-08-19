// lib/views/screens/calendar_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../data/images_list.dart';
import '../widgets/calendar/calendar_header.dart';
import '../widgets/calendar/calendar_grid.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class CalendarScreen extends StatefulWidget {
  // final CupertinoTabController tabController;

  const CalendarScreen({
    super.key,
    // required this.tabController,
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
                  imagesList: imagesList,
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
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return CupertinoPageScaffold(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: contextHeight),
                _buildCalendar(context),
                SizedBox(height: contextHeight * 0.5),
                Text(
                  'Selected Date: ${_dateFormat.format(_selectedDate)}',
                  style: TextStyle(
                    fontSize: contextHeight * 0.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                // ListView.builder(
                //   itemCount: imagesList.length, // 전역 변수 imagesList를 직접 사용
                //   itemBuilder: (context, index) {
                //     final imageData = imagesList[index];
                //     return CupertinoListTile(
                //       title: Text(imageData.uploadTime),
                //       subtitle: Text(
                //         '${imageData.pooType}, ${imageData.pooColor}, ${imageData.pooBlood}',
                //       ),
                //     );
                //   },
                // ),
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
                // widget.tabController.index = currentIndex;
              },
            ),
          ),
        ],
      ),
    );
  }
}
