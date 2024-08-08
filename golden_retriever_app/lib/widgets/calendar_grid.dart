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

    final weeks = <Widget>[];

    // Days of the week header
    weeks.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(7, (index) {
        final day = ['월', '화', '수', '목', '금', '토', '일'][index];
        return Text(day);
      }),
    ));

    // Dates grid
    int day = 1;
    for (int week = 0; week < 6; week++) {
      final days = <Widget>[];
      for (int i = 0; i < 7; i++) {
        if (week == 0 && i < firstDayOfMonth.weekday - 1) {
          days.add(Expanded(child: Container())); // Empty cell
        } else if (day > daysInMonth) {
          days.add(Expanded(child: Container())); // Empty cell
        } else {
          final currentDate = DateTime(focusedDate.year, focusedDate.month, day);
          days.add(
            Expanded(
              child: GestureDetector(
                onTap: () {
                  onDateSelected(currentDate);
                },
                child: Container(
                  width: 50.0, // 원하는 크기로 조정
                  height: 50.0, // 원하는 크기로 조정
                  margin: const EdgeInsets.all(1.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selectedDate == currentDate ? CupertinoColors.activeOrange : null,
                  ),
                  child: Text(
                    day.toString(),
                    style: TextStyle(
                      color: selectedDate == currentDate
                          ? CupertinoColors.white
                          : CupertinoColors.black,
                    ),
                  ),
                ),
              ),
            ),
          );
          day++;
        }
      }
      weeks.add(Row(
        children: days,
      ));
    }

    return Column(
      children: weeks,
    );
  }
}