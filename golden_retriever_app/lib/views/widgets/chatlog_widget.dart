// lib/views/widgets/home/chatlog_widget.dart

import 'package:flutter/cupertino.dart';
import 'package:golden_retriever_app/views/screens/chatlog_screen.dart';

import '../screens/hospital_list_screen.dart';

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
      child: Container(
        width: contextWidth * 9,
        height: contextHeight * 1.35,
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey.withOpacity(0.7),
          borderRadius: BorderRadius.circular(16.0),
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
                  fontWeight: FontWeight.w600
              ),
            ),
          ],
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
      ), // 원하는 패딩 추가
      child: Column(
        children: List.generate(itemCount * 2 - 1, (index) {
          if (index.isEven) {
            return ChatlogWidget(
              icon: children[index ~/ 2 % children.length].icon, // 순환하여 아이템을 선택
              label: children[index ~/ 2 % children.length].label,
              onPressed: children[index ~/ 2 % children.length].onPressed,
            );
          } else {
            return SizedBox(height: contextHeight * 0.2); // 위젯 사이에 10픽셀 간격 추가
          }
        }),
      ),
    );
  }
}
