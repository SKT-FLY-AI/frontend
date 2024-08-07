// lib/screens/entertainment_screen.dart
import 'package:flutter/cupertino.dart';

class EntertainmentScreen extends StatelessWidget {
  const EntertainmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Entertainment'),
      ),
      child: Center(
        child: Text('Entertainment Screen'),
      ),
    );
  }
}

