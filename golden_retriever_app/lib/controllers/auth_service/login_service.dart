// lib/services/auth_service/login_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../server_config.dart';

class LoginService {
  static final FlutterSecureStorage storage = FlutterSecureStorage();

  static Future<http.Response?> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$serverUrl/users/login');
    print('Attempting to login with URL: $url');
    final response = await _sendLoginRequest(url, email, password);

    if (response != null && response.statusCode == 200) {
      print('Login successful. Status Code: ${response.statusCode}');
      final data = json.decode(response.body) as Map<String, dynamic>;
      final accessToken = data['access_token'];

      print('Received Access Token: $accessToken');
      await _saveLoginInfo(email, password, accessToken);
      return response;  // http.Response 반환
    } else {
      print('Login failed: ${response?.statusCode} - ${response?.reasonPhrase}');
      return response;  // 오류 응답을 반환하거나 null 반환
    }
  }

  static Future<http.Response?> _sendLoginRequest(
      Uri url, String email, String password) async {
    try {
      print('Sending login request with email: $email');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      );
      print('Received response: ${response.statusCode} - ${response.reasonPhrase}');
      return response;
    } catch (e) {
      print('Error sending login request: $e');
      return null;
    }
  }

  static Future<void> _saveLoginInfo(String email, String password, String accessToken) async {
    print('Saving login information...');
    await storage.write(key: 'email', value: email);
    await storage.write(key: 'password', value: password);
    await storage.write(key: 'access_token', value: accessToken);
    print('Login information saved successfully.');
  }
}
