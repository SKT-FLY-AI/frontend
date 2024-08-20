// // lib/views/widgets/calendar/calendar_grid.dart
//
// import 'package:flutter/cupertino.dart';
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
//   Widget _buildDayCell(DateTime date) {
//     final bool isInMonth = date.month == focusedDate.month;
//     final bool isSelected = _isSelectedDate(date);
//
//     return CupertinoButton(
//       padding: EdgeInsets.zero, // padding을 0으로 설정하여 셀 크기를 유지
//       onPressed: () => onDateSelected(date), // 날짜 선택 콜백
//       child: Container(
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: _getDayBackgroundColor(date, isInMonth, isSelected),
//         ),
//         child: Text(
//           date.day.toString(),
//           style: TextStyle(
//             color: _getDayTextColor(isInMonth, isSelected), // 텍스트 색상
//           ),
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
//   Color _getDayBackgroundColor(DateTime date, bool isInMonth, bool isSelected) {
//     if (!isInMonth) {
//       return CupertinoColors.systemGrey4;
//     }
//
//     // 해당 날짜와 매칭되는 첫 번째 ImagesData를 찾음
//     final matchingImage = imagesList.firstWhere(
//           (image) => DateTime.parse(image.uploadTime).year == date.year &&
//           DateTime.parse(image.uploadTime).month == date.month &&
//           DateTime.parse(image.uploadTime).day == date.day,
//       orElse: () => ImagesData(pooColor: "#FFFFFF", uploadTime: ''),
//     );
//
//     if (matchingImage.pooColor != null) {
//       return Color(int.parse(matchingImage.pooColor!.substring(1), radix: 16) + 0xFF000000);
//     }
//
//     return isSelected ? CupertinoColors.activeOrange : CupertinoColors.white;
//   }
//
//   Color _getDayTextColor(bool isInMonth, bool isSelected) {
//     if (!isInMonth) {
//       return CupertinoColors.systemGrey;
//     }
//     return isSelected ? CupertinoColors.activeOrange : CupertinoColors.black;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final days = _generateDaysForGrid();
//
//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 7,
//         mainAxisSpacing: 6.0,
//         crossAxisSpacing: 6.0,
//       ),
//       itemCount: days.length,
//       itemBuilder: (context, index) => _buildDayCell(days[index]),
//       padding: EdgeInsets.zero,
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//     );
//   }
// }



import 'package:flutter/cupertino.dart';
import '../../../data/images_list.dart';

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

  Widget _buildDayCell(DateTime date) {
    final bool isInMonth = date.month == focusedDate.month;
    final bool isSelected = _isSelectedDate(date);

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => onDateSelected(date),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _getDayBackgroundColor(date, isInMonth, isSelected),
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

  Color _getDayBackgroundColor(DateTime date, bool isInMonth, bool isSelected) {
    if (!isInMonth) {
      return CupertinoColors.systemGrey4;
    }

    final matchingImage = imagesList.firstWhere(
          (image) => DateTime.parse(image.uploadTime).year == date.year &&
          DateTime.parse(image.uploadTime).month == date.month &&
          DateTime.parse(image.uploadTime).day == date.day,
      orElse: () => ImagesData(pooColor: "#FFFFFF", uploadTime: ''),
    );

    if (matchingImage.pooColor != null) {
      return Color(int.parse(matchingImage.pooColor!.substring(1), radix: 16) + 0xFF000000);
    }

    return isSelected ? CupertinoColors.activeOrange : CupertinoColors.white;
  }

  Color _getDayTextColor(bool isInMonth, bool isSelected) {
    if (!isInMonth) {
      return CupertinoColors.systemGrey;
    }
    return isSelected ? CupertinoColors.activeOrange : CupertinoColors.black;
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
                        fontSize: contextHeight * 0.15, // 텍스트 사이즈 조금 크게
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.secondaryLabel,
                        decoration: TextDecoration.none, // 밑줄 제거
                      ),
                    ),
                  ),
                ),
            ).toList(),
          ),
        ),
        GridView.builder(
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
        ),
      ],
    );
  }
}
