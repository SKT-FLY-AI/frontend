// lib/screens/chatlog_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ChatLogScreen extends StatelessWidget {
  final DateTime date;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  ChatLogScreen({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('챗로그 (${_dateFormat.format(date)})'),
      ),
      child: Center(
        child: Text('Chat Log for ${date.toString()}'), // Display the selected date
      ),
    );
  }
}
