// // lib/views/widgets/calendar/calendar_header.dart
//
// import 'package:flutter/cupertino.dart';
//
// class CalendarHeader extends StatelessWidget {
//   final DateTime focusedDate;
//   final VoidCallback onLeftArrowTap;
//   final VoidCallback onRightArrowTap;
//   final TextStyle? textStyle;
//   final EdgeInsetsGeometry? padding;
//
//   const CalendarHeader({
//     super.key,
//     required this.focusedDate,
//     required this.onLeftArrowTap,
//     required this.onRightArrowTap,
//     this.textStyle,
//     this.padding = const EdgeInsets.only(top: 4, bottom: 16, left: 16, right: 16),
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: padding!,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           CupertinoButton(
//             onPressed: onLeftArrowTap,
//             child: const Icon(CupertinoIcons.left_chevron),
//           ),
//           Text(
//             '${focusedDate.year}년 ${focusedDate.month.toString().padLeft(2, '0')}월',
//             style: textStyle ??
//                 const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//           ),
//           CupertinoButton(
//             onPressed: onRightArrowTap,
//             child: const Icon(CupertinoIcons.right_chevron),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';

class CalendarHeader extends StatelessWidget {
  final DateTime focusedDate;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  const CalendarHeader({
    super.key,
    required this.focusedDate,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
    this.textStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Padding(
      padding: padding ?? EdgeInsets.only(
        bottom: contextHeight * 0.2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
            onPressed: onLeftArrowTap,
            padding: EdgeInsets.zero, // 패딩을 없애서 아이콘 버튼을 컴팩트하게 유지
            child: Icon(
              CupertinoIcons.left_chevron,
              size: contextHeight * 0.2, // 화면 크기에 비례한 아이콘 크기
            ),
          ),
          Text(
            '${focusedDate.year}년 ${focusedDate.month.toString().padLeft(2, '0')}월',
            style: textStyle ??
                TextStyle(
                  fontSize: contextHeight * 0.2, // 화면 높이에 비례한 텍스트 크기
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white, // 텍스트 색상
                  decoration: TextDecoration.none, // 밑줄 제거
                ),
          ),
          CupertinoButton(
            onPressed: onRightArrowTap,
            padding: EdgeInsets.zero,
            child: Icon(
              CupertinoIcons.right_chevron,
              size: contextHeight * 0.2, // 화면 크기에 비례한 아이콘 크기
            ),
          ),
        ],
      ),
    );
  }
}
