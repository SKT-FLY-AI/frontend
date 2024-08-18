// lib/screens/image_preview.dart

import 'package:flutter/cupertino.dart';
import 'dart:io';
import '../../services/image_upload_service.dart';
import '../../services/dialog_service.dart';
import '../../services/chatbot/chatbot_service.dart';

class ImagePreview extends StatelessWidget {
  final String imagePath;

  const ImagePreview({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('이미지 미리보기'),
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
    showLoadingDialog(context); // 로딩 다이얼로그 표시

    try {
      final response = await sendImageUploadRequest(filePath);
      Navigator.pop(context); // 로딩 다이얼로그 닫기

      if (response.statusCode == 200) {
        showUploadResultDialog(context, '이미지가 성공적으로 업로드되었습니다.');
      } else {
        showUploadResultDialog(context, '이미지 업로드 실패: ${response.reasonPhrase}');
      }
    } catch (e) {
      Navigator.pop(context); // 로딩 다이얼로그 닫기
      showUploadResultDialog(context, '이미지 업로드 중 오류 발생: $e');
    }
  }

  void showUploadResultDialog(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('업로드 결과'),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              child: const Text('확인'),
              onPressed: () {
                Navigator.pop(context); // 결과 다이얼로그 닫기
                _navigateToCalendarAndShowChatbotOrCongrats(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _navigateToCalendarAndShowChatbotOrCongrats(BuildContext context) async {
    Navigator.pop(context); // 이미지 미리보기 화면 닫기

    // 약간의 지연을 추가하여 캘린더 탭이 완전히 로드되도록 함
    await Future.delayed(const Duration(milliseconds: 300));

    // 챗봇 표시 여부 확인 후 적절한 동작 수행
    bool shouldShow = await shouldShowChatbot();

    if (shouldShow) {
      showChatbotDialog(context); // 챗봇 다이얼로그 표시
    } else {
      showCongratsDialog(context); // Congrats 팝업 표시
    }
  }
}
