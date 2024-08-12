// lib/services/auth_service/register_service.dart

import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterService {
  static Future<http.Response?> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      // final url = Uri.parse('http://10.0.2.2:3001/users/signup/');
      final url = Uri.parse('http://223.194.44.32:8000/users/signup');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          "email": email,
          'password': password,
        }),
      );

      // Debugging: Log the response status and body
      print('Register response: ${response.statusCode}');
      print('Register response body: ${response.body}');

      return response;
    } catch (e) {
      // Debugging: Log the error message
      print('Error during registration: $e');
      return null;
    }
  }
}
