// calendar_screen.dart
import 'package:flutter/cupertino.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Calendar'),
      ),
      child: Center(
        child: Text('Calendar Widget Here'),
      ),
    );
  }
}
