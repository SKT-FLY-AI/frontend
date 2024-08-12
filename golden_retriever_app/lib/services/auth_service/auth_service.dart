// lib/services/auth_service/auth_service.dart

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'login_service.dart';
import 'register_service.dart';

class AuthService {
  static final FlutterSecureStorage _storage = FlutterSecureStorage();

  /// Fetches the username from secure storage.
  static Future<String?> getUsername() async {
    try {
      final username = await _storage.read(key: 'username');
      print('Fetched username: $username');  // Debug log
      return username;
    } catch (e) {
      print('Error fetching username: $e');  // Debug log
      return null;
    }
  }

  /// Logs in the user by delegating to LoginService.
  static Future<Map<String, dynamic>?> login({
    required String username,
    required String password,
  }) async {
    try {
      final success = await LoginService.login(username: username, password: password);

      if (success) {
        final storedUsername = await LoginService.getUsername();
        print('Stored Username: $storedUsername');

        // 여기서 제대로 저장된 경우에만 성공 처리
        if (storedUsername != null) {
          return {'username': storedUsername};
        } else {
          return {'message': 'Failed to store username'};
        }
      } else {
        return {'message': 'Login failed'};
      }
    } catch (e) {
      print('Error during login: $e');
      return {'message': 'An error occurred: $e'};
    }
  }

  /// Registers a new user by delegating to RegisterService.
  static Future<http.Response?> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await RegisterService.register(
        username: username,
        email: email,
        password: password,
      );

      print('Register response status: ${response?.statusCode}');  // Debug log
      return response;
    } catch (e) {
      print('Error during registration: $e');  // Debug log
      return null;
    }
  }
}
