// lib/services/chatbot_service.dart

import 'package:flutter/cupertino.dart';

void checkAndShowChatbot(BuildContext context) {
  if (shouldShowChatbot()) {
    showChatbotDialog(context);
  }
}

bool shouldShowChatbot() {
  // Replace this with your actual logic
  return true; // Always returns true for demonstration purposes
}

void showChatbotDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('Chatbot'),
        content: const Text('How can I assist you today?'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Close'),
            onPressed: () {
              Navigator.pop(context); // Close the chatbot dialog
            },
          ),
        ],
      );
    },
  );
}
