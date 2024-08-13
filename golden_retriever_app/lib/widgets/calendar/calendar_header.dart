// lib/widgets/calendar/calendar_header.dart

import 'package:flutter/cupertino.dart';

class CalendarHeader extends StatelessWidget {
  final DateTime focusedDate;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  const CalendarHeader({
    Key? key,
    required this.focusedDate,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
    this.textStyle,
    this.padding = const EdgeInsets.only(top: 4, bottom: 16, left: 16, right: 16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
            onPressed: onLeftArrowTap,
            child: const Icon(CupertinoIcons.left_chevron),
          ),
          Text(
            '${focusedDate.year}년 ${focusedDate.month.toString().padLeft(2, '0')}월',
            style: textStyle ??
                const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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
