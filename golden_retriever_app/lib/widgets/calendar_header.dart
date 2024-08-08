// lib/widgets/calendar_header.dart

import 'package:flutter/cupertino.dart';

class CalendarHeader extends StatelessWidget {
  final DateTime focusedDate;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;

  const CalendarHeader({
    Key? key,
    required this.focusedDate,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
            onPressed: onLeftArrowTap,
            child: const Icon(CupertinoIcons.left_chevron),
          ),
          Text(
            '${focusedDate.year}년 ${focusedDate.month.toString().padLeft(2, '0')}월',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold, // 글자를 볼드체로 설정
            ),
          ),
          CupertinoButton(
            onPressed: onRightArrowTap,
            child: const Icon(CupertinoIcons.right_chevron),
          ),
        ],
      ),
    );
  }
}