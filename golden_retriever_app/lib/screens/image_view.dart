import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'calendar_screen.dart';

class ImageView extends StatelessWidget {
  final String imagePath;
  final CupertinoTabController tabController;

  const ImageView({Key? key, required this.imagePath, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('미리보기'),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0), // 이미지 주변 여백
              child: Image.file(
                File(imagePath),
                fit: BoxFit.contain, // 이미지 비율을 유지하며 축소
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0), // 버튼과 화면 하단의 간격
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CupertinoButton(
                    color: Color.fromARGB(255, 255, 197, 115),
                    child: const Text('다시 찍기'),
                    onPressed: () {
                      Navigator.pop(context); // 이전 화면으로 돌아가기
                    },
                  ),
                  CupertinoButton(
                    color: CupertinoColors.activeOrange,
                    child: const Text('업로드'),
                    onPressed: () {
                      // 탭을 캘린더 탭으로 변경
                      tabController.index = 1;
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
