// lib/vies/screens/hospital_list_screen.dart

import 'package:flutter/cupertino.dart';

class HospitalListScreen extends StatelessWidget {
  final String title;
  final String content;

  const HospitalListScreen({
    super.key,
    this.title = '내 근처 병원',
    this.content = 'Map & Hospitals near me',
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      child: Center(
        child: Text(content),
      ),
    );
  }
}
