// lib/screens/image_preview.dart

import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class ImagePreview extends StatelessWidget {
  final String imagePath;
  final CupertinoTabController tabController;

  const ImagePreview({super.key, required this.imagePath, required this.tabController});

  // 이미지를 업로드하고 다이얼로그를 표시하는 비동기함수
  Future<void> _uploadImage(BuildContext context, String filePath) async {
    _showLoadingDialog(context);

    // 서버에 이미지 업로드 요청을 보내고 결과에 따른 처리를 함
    try {
      final response = await _sendImageUploadRequest(filePath);
      Navigator.pop(context); // Close the loading dialog

      if (response.statusCode == 200) {
        _showUploadResultDialog(context, 'Image uploaded successfully.');
      } else {
        _showUploadResultDialog(context, 'Image upload failed: ${response.reasonPhrase}');
      }
    } catch (e) {
      Navigator.pop(context); // Close the loading dialog
      _showUploadResultDialog(context, 'Error uploading image: $e');
    }
  }

  Future<http.StreamedResponse> _sendImageUploadRequest(String filePath) async {
    File file = File(filePath);
    String fileName = file.uri.pathSegments.last;

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://10.0.2.2:3001/images/upload/'), // Mock 서버 URL 사용
    );

    request.files.add(
      http.MultipartFile(
        'file',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: fileName,
      ),
    );

    return await request.send();
  }

  void _showLoadingDialog(BuildContext context) {
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

  // 사진 업로드 결과
  void _showUploadResultDialog(BuildContext context, String message) {
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
                Navigator.pop(context);
                Navigator.pop(context); // Close the ImageView screen
                tabController.index = 1; // Switch to the calendar tab
              },
            ),
          ],
        );
      },
    );
  }

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
}
