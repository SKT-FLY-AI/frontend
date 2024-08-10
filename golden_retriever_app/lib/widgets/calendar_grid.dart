// lib/widgets/calendar_grid.dart

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
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
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

    // 42 days cover the grid for 6 weeks (7 days per week)
    return List.generate(42, (index) => startDate.add(Duration(days: index)));
  }

  Widget _buildDayCell(DateTime date) {
    final bool isInMonth = date.month == focusedDate.month;
    final bool isSelected = _isSelectedDate(date);

    return GestureDetector(
      onTap: () => onDateSelected(date),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _getDayBackgroundColor(isInMonth, isSelected),
        ),
        child: Text(
          date.day.toString(),
          style: TextStyle(
            color: _getDayTextColor(isInMonth, isSelected),
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
