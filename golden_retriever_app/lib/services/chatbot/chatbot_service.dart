// lib/services/chatbot/chatbot_service.dart

import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../../views/screens/chatbot_screen.dart'; // 챗봇 화면 임포트
import 'chatbot_api_service.dart'; // 챗봇 API 서비스 임포트

/// 챗봇을 표시할지 여부를 결정하는 함수
/// 사용자 상호작용, 조건, 시간 지연 등에 따라 결정 가능
Future<bool> shouldShowChatbot() async {
  await Future.delayed(const Duration(seconds: 2)); // 2초 대기
  return true; // 예시로 항상 true 반환
}

/// 챗봇을 표시할 조건을 확인하고 챗봇 다이얼로그를 표시하는 함수
Future<void> checkAndShowChatbot(BuildContext context) async {
  bool shouldShow = await shouldShowChatbot(); // 결과를 기다림

  if (shouldShow) {
    showChatbotDialog(context); // 챗봇 다이얼로그 표시
  } else {
    showCongratsDialog(context); // Congrats 팝업 표시
  }
}

/// 챗봇 다이얼로그를 표시하는 함수
// void showChatbotDialog(BuildContext context) {
//   showCupertinoDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return CupertinoPageScaffold(
//         child: ChatbotScreen(), // 챗봇 화면 표시
//       );
//     },
//   );
// }
void showChatbotDialog(BuildContext context) {
  print("Attempting to show chatbot dialog");
  Navigator.push(
    context,
    CupertinoPageRoute(builder: (context) => ChatbotScreen()), // 챗봇 화면을 새로운 페이지로 푸시
  );
}

/// Congrats 팝업을 표시하는 함수
void showCongratsDialog(BuildContext context) {
  print("Showing Congrats dialog"); // 디버그 로그 추가
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('Congrats!'),
      );
    },
  );

  // 2초 후에 팝업 자동 닫기
  Future.delayed(const Duration(seconds: 2)).then((_) {
    print("Closing Congrats dialog"); // 디버그 로그 추가
    Navigator.pop(context);
  });
}

/// 챗봇 백엔드에 메시지를 보내고 응답을 받는 함수
Future<String?> sendMessageToChatbot(String message) async {
  try {
    String? response = await ChatbotApiService.sendMessage(message);
    return response;
  } catch (e) {
    print('챗봇에 메시지 전송 중 오류 발생: $e');
    return null;
  }
}
