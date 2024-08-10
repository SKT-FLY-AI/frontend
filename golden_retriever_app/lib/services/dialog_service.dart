// lib/services/dialog_service.dart

import 'package:flutter/cupertino.dart';
import 'navigation_service.dart';
import 'chatbot_service.dart';

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