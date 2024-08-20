// lib/views/screens/homeScreen/components/chatlog_widget.dart

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_retriever_app/views/screens/chatlog_screen.dart';
import '../../hospital_list_screen.dart';

class ChatlogWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  ChatlogWidget({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: contextWidth * 9,
            height: contextHeight * 1.35,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3), // 반투명 배경색
              borderRadius: BorderRadius.circular(16.0), // 모서리 둥글게
              border: Border.all(
                color: Colors.white.withOpacity(0.5), // 테두리 색상
                width: 1.0,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: contextHeight * 0.5, color: CupertinoColors.white),
                SizedBox(height: contextHeight * 0.05),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: contextHeight * 0.2,
                    color: CupertinoColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatlogWidgetColumn extends StatelessWidget {
  final int itemCount;

  ChatlogWidgetColumn({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    final List<ChatlogWidget> children = [
      ChatlogWidget(
        icon: CupertinoIcons.bubble_middle_bottom,
        label: '챗로그',
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => ChatLogScreen(),
            ),
          );
        },
      ),
      ChatlogWidget(
        icon: CupertinoIcons.map_pin_ellipse,
        label: '근처 병원',
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => HospitalListScreen(),
            ),
          );
        },
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: contextHeight * 0.4,
        horizontal: contextWidth * 0.6,
      ),
      child: Column(
        children: List.generate(itemCount * 2 - 1, (index) {
          if (index.isEven) {
            return ChatlogWidget(
              icon: children[index ~/ 2 % children.length].icon,
              label: children[index ~/ 2 % children.length].label,
              onPressed: children[index ~/ 2 % children.length].onPressed,
            );
          } else {
            return SizedBox(height: contextHeight * 0.2);
          }
        }),
      ),
    );
  }
}
