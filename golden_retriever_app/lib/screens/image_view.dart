// lib/screens/image_view.dart

import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class ImageView extends StatelessWidget {
  final String imagePath;
  final CupertinoTabController tabController;

  const ImageView({super.key, required this.imagePath, required this.tabController});

  Future<void> uploadImage(String filePath) async {
    try {
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

      var response = await request.send();

      if (response.statusCode == 200) {
        print('Image uploaded successfully.');
      } else {
        print('Image upload failed: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
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
            await uploadImage(imagePath);
            Navigator.pop(context);
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