// lib/screens/calendar_screen.dart

// import 'package:flutter/cupertino.dart';

// class CalendarScreen extends StatefulWidget {
//   const CalendarScreen({super.key});

//   @override
//   _CalendarScreenState createState() => _CalendarScreenState();
// }

// class _CalendarScreenState extends State<CalendarScreen> {
//   DateTime _focusedDate = DateTime.now();
//   DateTime _selectedDate = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: const CupertinoNavigationBar(
//         middle: Text('Calendar'),
//       ),
//       child: Center(
//         child: Column(
//           children: [
//             const SizedBox(height: 100), // 캘린더 상단의 여백을 조정
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 16.0),
//               padding: const EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 color: CupertinoColors.systemGrey6,
//                 borderRadius: BorderRadius.circular(20.0),
//                 boxShadow: [
//                   BoxShadow(
//                     color: CupertinoColors.black.withOpacity(0.2),
//                     blurRadius: 10.0,
//                     offset: Offset(0, 5),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   _buildCalendarHeader(),
//                   _buildCalendarGrid(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCalendarHeader() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           CupertinoButton(
//             onPressed: () {
//               setState(() {
//                 _focusedDate = DateTime(_focusedDate.year, _focusedDate.month - 1);
//               });
//             },
//             child: const Icon(CupertinoIcons.left_chevron),
//           ),
//           Text(
//             '${_focusedDate.year}-${_focusedDate.month.toString().padLeft(2, '0')}',
//             style: const TextStyle(fontSize: 20),
//           ),
//           CupertinoButton(
//             onPressed: () {
//               setState(() {
//                 _focusedDate = DateTime(_focusedDate.year, _focusedDate.month + 1);
//               });
//             },
//             child: const Icon(CupertinoIcons.right_chevron),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCalendarGrid() {
//     final firstDayOfMonth = DateTime(_focusedDate.year, _focusedDate.month, 1);
//     final lastDayOfMonth = DateTime(_focusedDate.year, _focusedDate.month + 1, 0);
//     final daysInMonth = lastDayOfMonth.day;

//     final weeks = <Widget>[];

//     // Days of the week header
//     weeks.add(Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: List.generate(7, (index) {
//         final day = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index];
//         return Text(day);
//       }),
//     ));

//     // Dates grid
//     int day = 1;
//     for (int week = 0; week < 6; week++) {
//       final days = <Widget>[];
//       for (int i = 0; i < 7; i++) {
//         if (week == 0 && i < firstDayOfMonth.weekday - 1) {
//           days.add(Expanded(child: Container())); // Empty cell
//         } else if (day > daysInMonth) {
//           days.add(Expanded(child: Container())); // Empty cell
//         } else {
//           final currentDate = DateTime(_focusedDate.year, _focusedDate.month, day);
//           days.add(
//             Expanded(
//               child: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _selectedDate = currentDate;
//                   });
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: _selectedDate == currentDate
//                         ? CupertinoColors.activeBlue
//                         : CupertinoColors.systemGrey6,
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   margin: const EdgeInsets.all(4.0),
//                   alignment: Alignment.center,
//                   child: Text(
//                     day.toString(),
//                     style: TextStyle(
//                       color: _selectedDate == currentDate
//                           ? CupertinoColors.white
//                           : CupertinoColors.black,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//           day++;
//         }
//       }
//       weeks.add(Row(
//         children: days,
//       ));
//     }

//     return Column(
//       children: weeks,
//     );
//   }
// }

import 'package:flutter/cupertino.dart';

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
                  _buildCalendarHeader(),
                  _buildCalendarGrid(),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildInfoBox('Chat Log', _selectedDateInfo),
                    const SizedBox(height: 16.0),
                    _buildInfoBox('Status', _selectedDateStatus),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
            onPressed: () {
              setState(() {
                _focusedDate = DateTime(_focusedDate.year, _focusedDate.month - 1);
              });
            },
            child: const Icon(CupertinoIcons.left_chevron),
          ),
          Text(
            '${_focusedDate.year}-${_focusedDate.month.toString().padLeft(2, '0')}',
            style: const TextStyle(fontSize: 20),
          ),
          CupertinoButton(
            onPressed: () {
              setState(() {
                _focusedDate = DateTime(_focusedDate.year, _focusedDate.month + 1);
              });
            },
            child: const Icon(CupertinoIcons.right_chevron),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    final firstDayOfMonth = DateTime(_focusedDate.year, _focusedDate.month, 1);
    final lastDayOfMonth = DateTime(_focusedDate.year, _focusedDate.month + 1, 0);
    final daysInMonth = lastDayOfMonth.day;

    final weeks = <Widget>[];

    // Days of the week header
    weeks.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(7, (index) {
        final day = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index];
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
          final currentDate = DateTime(_focusedDate.year, _focusedDate.month, day);
          days.add(
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDate = currentDate;
                    _selectedDateInfo = "Event for $currentDate"; // 임시 이벤트 정보
                    _selectedDateStatus = "Status for $currentDate"; // 임시 상태 정보
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: _selectedDate == currentDate
                        ? CupertinoColors.activeBlue
                        : CupertinoColors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  child: Text(
                    day.toString(),
                    style: TextStyle(
                      color: _selectedDate == currentDate
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

  Widget _buildInfoBox(String title, String content) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(content),
        ],
      ),
    );
  }
}