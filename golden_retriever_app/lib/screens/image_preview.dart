// lib/screens/image_preview.dart

import 'package:flutter/cupertino.dart';
import 'dart:io';
import '../services/image_upload_service.dart';
import '../services/dialog_service.dart';
import '../services/chatbot/chatbot_service.dart';

class ImagePreview extends StatelessWidget {
  final String imagePath;
  final CupertinoTabController tabController;

  const ImagePreview({super.key, required this.imagePath, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Image View'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.check_mark_circled),
          onPressed: () async {
            await _uploadImage(context, imagePath);
          },
        ),
      ),
      child: Center(
        child: Image.file(
          File(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Future<void> _uploadImage(BuildContext context, String filePath) async {
    showLoadingDialog(context);

    try {
      final response = await sendImageUploadRequest(filePath);
      Navigator.pop(context); // Close the loading dialog

      if (response.statusCode == 200) {
        showUploadResultDialog(context, 'Image uploaded successfully.');
      } else {
        showUploadResultDialog(context, 'Image upload failed: ${response.reasonPhrase}');
      }
    } catch (e) {
      Navigator.pop(context); // Close the loading dialog
      showUploadResultDialog(context, 'Error uploading image: $e');
    }
  }

  void showUploadResultDialog(BuildContext context, String message) {
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
                _navigateToCalendarAndShowChatbot(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _navigateToCalendarAndShowChatbot(BuildContext context) {
    Navigator.pop(context); // Close the ImageView screen
    tabController.index = 1; // Switch to the calendar tab

    // Delay the chatbot appearance slightly to ensure the calendar tab is fully loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showChatbotDialog(context); // Show the chatbot dialog
    });
  }
}
