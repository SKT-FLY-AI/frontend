// lib/views/widgets/calendar/calendar_grid.dart

import 'package:flutter/cupertino.dart';

class CalendarGrid extends StatelessWidget {
  final DateTime focusedDate;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const CalendarGrid({
    Key? key,
    required this.focusedDate,
    required this.selectedDate,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final days = _generateDaysForGrid();

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
      ),
      itemCount: days.length,
      itemBuilder: (context, index) => _buildDayCell(days[index]),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  List<DateTime> _generateDaysForGrid() {
    final firstDayOfMonth = DateTime(focusedDate.year, focusedDate.month, 1);
    final int leadingEmptyDays = (firstDayOfMonth.weekday - 1) % 7;
    final startDate = firstDayOfMonth.subtract(Duration(days: leadingEmptyDays));

    return List.generate(42, (index) => startDate.add(Duration(days: index)));
  }

  Widget _buildDayCell(DateTime date) {
    final bool isInMonth = date.month == focusedDate.month;
    final bool isSelected = _isSelectedDate(date);

    return CupertinoButton(
      padding: EdgeInsets.zero, // padding을 0으로 설정하여 셀 크기를 유지
      onPressed: () => onDateSelected(date), // 날짜 선택 콜백
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _getDayBackgroundColor(isInMonth, isSelected), // 배경색
        ),
        child: Text(
          date.day.toString(),
          style: TextStyle(
            color: _getDayTextColor(isInMonth, isSelected), // 텍스트 색상
          ),
        ),
      ),
    );
  }

  bool _isSelectedDate(DateTime date) {
    return selectedDate.year == date.year &&
        selectedDate.month == date.month &&
        selectedDate.day == date.day;
  }

  Color _getDayBackgroundColor(bool isInMonth, bool isSelected) {
    if (!isInMonth) {
      return CupertinoColors.systemGrey4;
    }
    return isSelected ? CupertinoColors.activeOrange : CupertinoColors.white;
  }

  Color _getDayTextColor(bool isInMonth, bool isSelected) {
    if (!isInMonth) {
      return CupertinoColors.systemGrey;
    }
    return isSelected ? CupertinoColors.white : CupertinoColors.black;
  }
}
