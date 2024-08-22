// // lib/views/screens/calendarScreen/components/calendar_grid.dart
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../../data/images_list.dart';
//
// class CalendarGrid extends StatelessWidget {
//   final DateTime focusedDate;
//   final DateTime selectedDate;
//   final ValueChanged<DateTime> onDateSelected;
//   final List<ImagesData> imagesList;
//
//   const CalendarGrid({
//     super.key,
//     required this.focusedDate,
//     required this.selectedDate,
//     required this.onDateSelected,
//     required this.imagesList,
//   });
//
//   List<DateTime> _generateDaysForGrid() {
//     final firstDayOfMonth = DateTime(focusedDate.year, focusedDate.month, 1);
//     final int leadingEmptyDays = (firstDayOfMonth.weekday - 1) % 7;
//     final startDate = firstDayOfMonth.subtract(Duration(days: leadingEmptyDays));
//
//     return List.generate(42, (index) => startDate.add(Duration(days: index)));
//   }
//
//   Widget _buildDayCell(BuildContext context, DateTime date) {
//     final bool isInMonth = date.month == focusedDate.month;
//     final bool isSelected = _isSelectedDate(date);
//     final bool isToday = _isToday(date);
//
//     if (!isInMonth) {
//       return const SizedBox.shrink(); // 다른 달의 날짜는 빈 위젯을 반환
//     }
//
//     // 현재 화면의 너비와 높이를 기준으로 아이콘과 텍스트 크기를 조정
//     final double iconSize = MediaQuery.of(context).size.width * 0.07; // 아이콘 크기 화면 너비의 7%
//     final double fontSize = MediaQuery.of(context).size.width * 0.04; // 텍스트 크기 화면 너비의 4%
//
//     return CupertinoButton(
//       padding: EdgeInsets.zero,
//       onPressed: () => onDateSelected(date),
//       child: Container(
//         alignment: Alignment.center,
//         child: Stack(
//           children: [
//             if (isToday) // 오늘 날짜인 경우 회색 원 표시
//               Container(
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.grey.withOpacity(0.7), // 회색 배경
//                 ),
//               ),
//             if (isSelected) // 선택된 날짜일 경우 주황색 원이 더 위에 표시
//               Container(
//                 alignment: Alignment.center,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: CupertinoColors.activeOrange, // 주황색 배경
//                 ),
//               ),
//             Align(
//               alignment: FractionalOffset.topLeft,
//               child: Padding(
//                 padding: EdgeInsets.all(iconSize * 0.2), // 패딩 크기를 아이콘 크기에 비례하여 조정
//                 child: Text(
//                   date.day.toString(),
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: fontSize, // 동적 폰트 크기
//                   ),
//                 ),
//               ),
//             ),
//             if (_hasMatchingImage(date))
//               Align(
//                 alignment: FractionalOffset.bottomRight,
//                 child: Padding(
//                   padding: EdgeInsets.all(iconSize * 0.1), // 패딩 크기를 아이콘 크기에 비례하여 조정
//                   child: Image.asset(
//                     'assets/icons/poop.png',
//                     height: iconSize, // 동적 아이콘 크기
//                     color: _getIconColor(date),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   bool _isSelectedDate(DateTime date) {
//     return selectedDate.year == date.year &&
//         selectedDate.month == date.month &&
//         selectedDate.day == date.day;
//   }
//
//   bool _isToday(DateTime date) {
//     final today = DateTime.now();
//     return today.year == date.year &&
//         today.month == date.month &&
//         today.day == date.day;
//   }
//
//   bool _hasMatchingImage(DateTime date) {
//     return imagesList.any(
//           (image) => DateTime.parse(image.uploadTime).year == date.year &&
//           DateTime.parse(image.uploadTime).month == date.month &&
//           DateTime.parse(image.uploadTime).day == date.day,
//     );
//   }
//
//   Color _getIconColor(DateTime date) {
//     final matchingImage = imagesList.firstWhere(
//           (image) => DateTime.parse(image.uploadTime).year == date.year &&
//           DateTime.parse(image.uploadTime).month == date.month &&
//           DateTime.parse(image.uploadTime).day == date.day,
//       orElse: () => ImagesData(pooColor: "#FFFFFF", uploadTime: ''),
//     );
//
//     return Color(int.parse(matchingImage.pooColor!.substring(1), radix: 16) + 0xFF000000);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final double contextHeight = MediaQuery.of(context).size.height * 0.1;
//
//     final days = _generateDaysForGrid();
//     final dayLabels = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
//
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.only(bottom: contextHeight * 0.25),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: dayLabels.map((label) =>
//                 Expanded(
//                   child: Container(
//                     alignment: Alignment.center,
//                     child: Text(
//                       label,
//                       style: TextStyle(
//                         fontSize: contextHeight * 0.15,
//                         fontWeight: FontWeight.bold,
//                         color: CupertinoColors.secondaryLabel,
//                         decoration: TextDecoration.none,
//                       ),
//                     ),
//                   ),
//                 ),
//             ).toList(),
//           ),
//         ),
//         GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 7,
//             mainAxisSpacing: 6.0,
//             crossAxisSpacing: 6.0,
//           ),
//           itemCount: days.length,
//           itemBuilder: (context, index) => _buildDayCell(context, days[index]),
//           padding: EdgeInsets.zero,
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//         ),
//       ],
//     );
//   }
// }



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../models/data/images_list.dart';

class CalendarGrid extends StatelessWidget {
  final DateTime focusedDate;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;
  final List<ImagesData> imagesList;

  const CalendarGrid({
    super.key,
    required this.focusedDate,
    required this.selectedDate,
    required this.onDateSelected,
    required this.imagesList,
  });

  List<DateTime> _generateDaysForGrid() {
    final firstDayOfMonth = DateTime(focusedDate.year, focusedDate.month, 1);
    final int leadingEmptyDays = (firstDayOfMonth.weekday - 1) % 7;
    final startDate = firstDayOfMonth.subtract(Duration(days: leadingEmptyDays));

    return List.generate(42, (index) => startDate.add(Duration(days: index)));
  }

  Widget _buildDayCell(BuildContext context, DateTime date) {
    final bool isInMonth = date.month == focusedDate.month;
    final bool isSelected = _isSelectedDate(date);
    final bool isToday = _isToday(date);

    if (!isInMonth) {
      return const SizedBox.shrink(); // 다른 달의 날짜는 빈 위젯을 반환
    }

    final double iconSize = MediaQuery.of(context).size.width * 0.07;
    final double fontSize = MediaQuery.of(context).size.width * 0.04;

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => onDateSelected(date),
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            if (isToday)
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.7),
                ),
              ),
            if (isSelected)
              Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: CupertinoColors.activeOrange,
                ),
              ),
            Align(
              alignment: FractionalOffset.topLeft,
              child: Padding(
                padding: EdgeInsets.all(iconSize * 0.2),
                child: Text(
                  date.day.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),
            if (_hasMatchingImage(date))
              Align(
                alignment: FractionalOffset.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(iconSize * 0.1),
                  child: Image.asset(
                    'assets/icons/poop.png',
                    height: iconSize,
                    color: _getIconColor(date),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  bool _isSelectedDate(DateTime date) {
    return selectedDate.year == date.year &&
        selectedDate.month == date.month &&
        selectedDate.day == date.day;
  }

  bool _isToday(DateTime date) {
    final today = DateTime.now();
    return today.year == date.year &&
        today.month == date.month &&
        today.day == date.day;
  }

  bool _hasMatchingImage(DateTime date) {
    return imagesList.any(
          (image) => DateTime.parse(image.uploadTime).year == date.year &&
          DateTime.parse(image.uploadTime).month == date.month &&
          DateTime.parse(image.uploadTime).day == date.day,
    );
  }

  Color _getIconColor(DateTime date) {
    final matchingImage = imagesList.firstWhere(
          (image) => DateTime.parse(image.uploadTime).year == date.year &&
          DateTime.parse(image.uploadTime).month == date.month &&
          DateTime.parse(image.uploadTime).day == date.day,
      orElse: () => ImagesData(pooColor: "#FFFFFF", uploadTime: ''),
    );

    return Color(int.parse(matchingImage.pooColor!.substring(1), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    final days = _generateDaysForGrid();
    final dayLabels = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: contextHeight * 0.25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: dayLabels.map((label) =>
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: contextHeight * 0.15,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.secondaryLabel,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
            ).toList(),
          ),
        ),
        Expanded( // 여기서 Flexible을 사용하여 GridView가 차지하는 공간을 유연하게
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 6.0,
              crossAxisSpacing: 6.0,
            ),
            itemCount: days.length,
            itemBuilder: (context, index) => _buildDayCell(context, days[index]),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ),
      ],
    );
  }
}
