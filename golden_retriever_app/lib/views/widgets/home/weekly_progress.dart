// lib/views/widgets/home/weekly_progress.dart

import 'package:flutter/cupertino.dart';

// 주간 진행 상태를 표시하는 위젯
class WeeklyProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: contextHeight * 0.1, horizontal: contextWidth * 0.6),
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey.withOpacity(0.7),
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
              SizedBox(height: 18.0),
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
                    CupertinoIcons.drop_fill,
                    size: 35,
                    color: CupertinoColors.systemBrown,
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
