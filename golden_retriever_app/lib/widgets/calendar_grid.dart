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
    final firstDayOfMonth = DateTime(focusedDate.year, focusedDate.month, 1);
    final lastDayOfMonth = DateTime(focusedDate.year, focusedDate.month + 1, 0);
    final daysInMonth = lastDayOfMonth.day;

    // Calculate the first day of the week for the calendar grid
    final int leadingEmptyDays = (firstDayOfMonth.weekday - 1) % 7;
    final DateTime startDate = firstDayOfMonth.subtract(Duration(days: leadingEmptyDays));
    final DateTime endDate = startDate.add(Duration(days: 41)); // 6 weeks later

    final days = <Widget>[];
    for (DateTime date = startDate; date.isBefore(endDate.add(Duration(days: 1))); date = date.add(Duration(days: 1))) {
      final bool isInMonth = date.month == focusedDate.month;
      final bool isSelected = selectedDate.year == date.year &&
                              selectedDate.month == date.month &&
                              selectedDate.day == date.day;

      days.add(
        GestureDetector(
          onTap: () {
            onDateSelected(date);
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isInMonth ? (isSelected ? CupertinoColors.activeOrange : CupertinoColors.white) : CupertinoColors.systemGrey4,
            ),
            child: Text(
              date.day.toString(),
              style: TextStyle(
                color: isInMonth ? (isSelected ? CupertinoColors.white : CupertinoColors.black) : CupertinoColors.systemGrey,
              ),
            ),
          ),
        ),
      );
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
      itemCount: days.length,
      itemBuilder: (context, index) {
        return days[index];
      },
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
