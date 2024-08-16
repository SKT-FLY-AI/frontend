// lib/screens/status_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class StatusScreen extends StatelessWidget {
  final DateTime date;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  StatusScreen({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('상태 (${_dateFormat.format(date)})'),
      ),
      child: Center(
        child: Text('Status for ${date.toString()}'), // Display the selected date
      ),
    );
  }
}
