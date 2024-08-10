// lib/services/dialog_service.dart

import 'package:flutter/cupertino.dart';
import 'navigation_service.dart';

void showLoadingDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return const CupertinoAlertDialog(
        title: Text('Uploading...'),
        content: CupertinoActivityIndicator(),
      );
    },
  );
}

void showUploadResultDialog(BuildContext context, String message, CupertinoTabController tabController) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Text('Upload Result'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              navigateToCalendar(context, tabController); // Move to the calendar tab
              checkAndShowChatbot(context); // Check and show the chatbot if needed
            },
          ),
        ],
      );
    },
  );
}

void checkAndShowChatbot(BuildContext context) {
  if (shouldShowChatbot()) {
    showChatbotDialog(context);
  }
}

bool shouldShowChatbot() {
  // Replace this with your actual logic to determine if the chatbot should be shown
  return true; // For demonstration purposes, always returns true
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
