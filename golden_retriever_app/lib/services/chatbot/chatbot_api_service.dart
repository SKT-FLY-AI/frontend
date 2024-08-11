// lib/services/chatbot/chatbot_api_service.dart
// 챗봇의 메시지를 처리하는 백엔드와의 통신을 담당

import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatbotApiService {
  static Future<String?> sendMessage(String message) async {
    try {
      final url = Uri.parse('http://your.backend.api/endpoint/chatbot');  // Replace with actual backend endpoint
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'message': message}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['response'];  // Assuming the response from the backend includes a 'response' field
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error during chatbot communication: $e');
      return null;
    }
  }
}
