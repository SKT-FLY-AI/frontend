// lib/screens/home_screen.dart

import 'package:flutter/cupertino.dart';
import '../widgets/info_card.dart';

class HomeScreen extends StatelessWidget {
  final CupertinoTabController tabController;

  const HomeScreen({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  '채원 님, 좋은 아침입니다!',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black, // 원하는 색상으로 변경
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(), // GridView의 스크롤을 비활성화
                  shrinkWrap: true, // GridView가 Column의 남은 공간을 모두 사용하지 않도록 설정
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 1, // 정사각형 모양의 그리드 아이템
                  ),
                  itemCount: 50, // 예를 들어 50개의 아이템을 무한 스크롤로 보여줌
                  itemBuilder: (context, index) {
                    return InfoCard(
                      title: 'Title $index',
                      detail: 'Detail for item $index',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}