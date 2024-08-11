// lib/services/chatbot/chatbot_service.dart
// 챗봇을 표시할지 여부를 결정, 챗봇 화면을 대화 상자로 표시하는 역할

import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../../screens/chatbot_screen.dart'; // Import the ChatbotScreen
import 'chatbot_api_service.dart'; // Import the Chatbot API service

/// Function to decide whether to show the chatbot.
/// This could be based on user interaction, conditions, or time delays.
Future<bool> shouldShowChatbot() async {
  await Future.delayed(const Duration(seconds: 2)); // Wait for 2 seconds
  return true; // Return true after the delay
}

/// Function to check the condition and show the chatbot dialog.
Future<void> checkAndShowChatbot(BuildContext context) async {
  bool shouldShow = await shouldShowChatbot(); // Wait for the result

  if (shouldShow) {
    showChatbotDialog(context);
  }
}

/// Function to display the chatbot dialog.
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

/// Function to send a message to the chatbot backend and get a response.
Future<String?> sendMessageToChatbot(String message) async {
  try {
    String? response = await ChatbotApiService.sendMessage(message);
    return response;
  } catch (e) {
    print('Error sending message to chatbot: $e');
    return null;
  }
}
