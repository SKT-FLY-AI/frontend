// lib/services/auth_service/login_service.dart

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginService {
  static final FlutterSecureStorage _storage = FlutterSecureStorage();

  /// Performs user login, stores the access token and username if successful, and returns a boolean status.
  static Future<bool> login({
    required String username,
    required String password,
  }) async {
    try {
      final url = Uri.parse('http://223.194.44.32:8000/users/login');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );

      print('Login response: ${response.statusCode}');
      print('Login response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        String message = data['message'];
        String accessToken = data['access_token'];

        // Store the access token and username securely
        await _storage.write(key: 'access_token', value: accessToken);
        await _storage.write(key: 'username', value: username);

        print('$message');

        return true;
      } else {
        print('Failed to login, status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error during login: $e');
      return false;
    }
  }

  /// Retrieves the stored access token.
  static Future<String?> getAccessToken() async {
    return await _storage.read(key: 'access_token');
  }

  /// Retrieves the stored username.
  static Future<String?> getUsername() async {
    return await _storage.read(key: 'username');
  }

  /// Clears the stored access token and username.
  static Future<void> logout() async {
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'username');
    print('Logged out successfully');
  }
}
