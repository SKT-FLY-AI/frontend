// lib/widgets/info_box.dart

import 'package:flutter/cupertino.dart';

class InfoBox extends StatelessWidget {
  final String title;
  final String content;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? contentColor;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double titleFontSize;
  final double contentFontSize;
  final FontWeight titleFontWeight;

  const InfoBox({
    Key? key,
    required this.title,
    required this.content,
    this.backgroundColor = CupertinoColors.systemGrey6,
    this.titleColor = CupertinoColors.black,
    this.contentColor = CupertinoColors.black,
    this.borderRadius = 20.0,
    this.margin = const EdgeInsets.symmetric(horizontal: 12.0),
    this.padding = const EdgeInsets.only(top: 24, bottom: 32, left: 32, right: 32),
    this.titleFontSize = 18.0,
    this.contentFontSize = 16.0,
    this.titleFontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: titleFontWeight,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            content,
            style: TextStyle(
              fontSize: contentFontSize,
              color: contentColor,
            ),
          ),
        ],
      ),
    );
  }
}
