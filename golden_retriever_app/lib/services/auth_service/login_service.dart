// lib/services/auth_service/login_service.dart

import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginService {
  static Future<http.Response?> login({
    required String username,
    required String password,
  }) async {
    try {
      final url = Uri.parse('http://10.0.2.2:3001/users/login'); // Mock 서버 URL 사용
      // final url = Uri.parse('http://10.0.2.2:8000/users/login'); // FastAPI 서버 URL 사용
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );

      // Debugging: Log the response status and body
      print('Login response: ${response.statusCode}');
      print('Login response body: ${response.body}');

      return response;
    } catch (e) {
      // Debugging: Log the error message
      print('Error during login: $e');
      return null;
    }
  }
}
