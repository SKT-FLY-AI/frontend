// lib/widgets/info_card.dart

import 'package:flutter/cupertino.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String detail;
  final Color? titleColor;
  final Color? detailColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;

  const InfoCard({
    super.key,
    required this.title,
    required this.detail,
    this.titleColor = CupertinoColors.black,
    this.detailColor = CupertinoColors.black,
    this.backgroundColor = CupertinoColors.systemGrey6,
    this.padding = const EdgeInsets.all(16.0),
    this.borderRadius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            detail,
            style: TextStyle(
              color: detailColor,
            ),
          ),
        ],
      ),
    );
  }
}
