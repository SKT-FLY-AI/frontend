// lib/services/chatbot/chatbot_api_service.dart
// 챗봇의 메시지를 처리하는 백엔드와의 통신을 담당

import 'package:http/http.dart' as http;
import '../../server_config.dart';

class ChatbotApiService {
  static Future<String?> sendMessage(String message) async {
    final url = Uri.parse('$serverUrl/chatgpt/chat');  // Replace with actual backend endpoint

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'text/plain',  // Change to 'text/plain' if the server is sending plain text
        },
        body: '{"message": "$message"}',  // Sending the message in JSON format
      );

      if (response.statusCode == 200) {
        // Directly return the plain text response
        return response.body;
      } else {
        print('Error: Server responded with status code ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error during chatbot communication: $e');
      return null;
    }
  }
}
