// lib/views/widgets/home/weekly_progress.dart

import 'package:flutter/cupertino.dart';

// 주간 진행 상태를 표시하는 위젯
class WeeklyProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Container 위젯을 반환하여 null 문제가 발생하지 않도록 보장함
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '이번 주',
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(7, (index) {
                  const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                  return Text(
                    days[index],
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 16,
                    ),
                  );
                }),
              ),
              SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(7, (index) {
                  return Icon(
                    CupertinoIcons.heart,
                    color: CupertinoColors.activeOrange,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
