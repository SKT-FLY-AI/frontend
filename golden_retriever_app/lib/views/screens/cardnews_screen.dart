// lib/views/screens/cardnews_screen.dart

import 'package:flutter/cupertino.dart';

// 카드 뉴스 데이터를 포함하는 클래스
class CardnewsData {
  final String title;
  final String content;

  CardnewsData(this.title, this.content);
}

// 카드 뉴스 목록
final List<CardnewsData> cardnewsList = [
  CardnewsData(
    "변비 | 질환백과 | 의료정보 | 건강정보 | 서울아산병원",
    "변의를 무시하면 직장벽의 지각이 둔화되어 변의를 느끼지 못하게 됩니다. 정상인의 대변 무게는 하루에 35~225g입니다. 식사를 충분히 하지 못하거나 물을 충분히 마시지 ...",
  ),
  CardnewsData(
    "변비 - 나무위키",
    "4 days ago ... 2. 원인[편집] · 선천성 거대결장 · 갑상선 이상으로 갑상선 호르몬이 감소할 시, 무기력하고 추위를 느끼면서 변비를 앓게 되는데 그 원인이 아이오딘(오 ...",
  ),
  CardnewsData(
    "변비 - 위키백과, 우리 모두의 백과사전",
    "변비 ... 변비(便祕, constipation)는 대변이 대장에 오래 머물고 정상적으로 배변되지 않는 증상이다. 변비증(便祕症)이라고도 한다.",
  ),
  CardnewsData(
    "변비 관리 | Memorial Sloan Kettering Cancer Center",
    "폴리에틸렌 글리콜(MiraLAX®)과 같은 삼투성 하제는 인체 속 물을 사용하여 대변을 부드럽게 만들어 대변이 대장을 쉽게 통과할 수 있도록 도와줍니다.",
  ),
  CardnewsData(
    "성인의 변비 - MSD 매뉴얼 - 일반인용",
    "의사가 하는 일 · 대변 빈도, 일관도, 힘주기 필요 또는 구명법 사용(배변 중 음낭 또는 질 및 항문[회음] 사이 부위로 밀어 넣는 등) · 불완전한 배출의 느낌 · 배변 후 ...",
  ),
];

// 카드 뉴스 스크린을 나타내는 위젯
class CardnewsScreen extends StatelessWidget {
  final int index; // 인덱스만 받도록 수정

  const CardnewsScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // 인덱스에 해당하는 데이터 가져오기
    final cardnews = cardnewsList[index];

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(cardnews.title),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(cardnews.content),
        ),
      ),
    );
  }
}
