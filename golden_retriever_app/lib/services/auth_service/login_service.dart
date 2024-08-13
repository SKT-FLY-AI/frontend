// lib/services/auth_service/login_service.dart

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginService {
  static final FlutterSecureStorage storage = FlutterSecureStorage();

  /// Performs user login, stores the access token and username if successful, and returns a boolean status.
  static Future<bool> login({
    required String username,
    required String password,
  }) async {
    try {
      // final url = Uri.parse('http://10.0.2.2:3001/users/login');  // 안드 에뮬레이터 IP
      final url = Uri.parse('http://223.194.44.32:8000/users/login');  // 우리팀 서버 IP
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final accessToken = data['access_token'];

        await storage.write(key: 'access_token', value: accessToken);
        await storage.write(key: 'username', value: username);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  /// Retrieves the stored access token.
  static Future<String?> getAccessToken() async {
    return await storage.read(key: 'access_token');
  }

  /// Retrieves the stored username.
  static Future<String?> getUsername() async {
    return await storage.read(key: 'username');
  }

  /// Clears the stored access token and username.
  static Future<void> logout() async {
    await storage.delete(key: 'access_token');
    await storage.delete(key: 'username');
  }
}
