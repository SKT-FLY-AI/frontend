// lib/services/chatbot_service.dart

import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../screens/chatbot_screen.dart'; // Import the ChatbotScreen

Future<bool> shouldShowChatbot() async {
  await Future.delayed(const Duration(seconds: 2)); // Wait for 2 seconds
  return true; // Return true after the delay
}

Future<void> checkAndShowChatbot(BuildContext context) async {
  bool shouldShow = await shouldShowChatbot(); // Wait for the result

  if (shouldShow) {
    showChatbotDialog(context);
  }
}

void showChatbotDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoPageScaffold(
        child: ChatbotScreen(), // Display the ChatbotScreen
      );
    },
  );
}
