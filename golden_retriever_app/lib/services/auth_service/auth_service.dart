// lib/services/auth_service/auth_service.dart

import 'package:http/http.dart' as http;
import 'login_service.dart';
import 'register_service.dart';

class AuthService {
  /// Logs in the user by delegating to LoginService.
  static Future<Map<String, dynamic>?> login({
    required String username,
    required String password,
  }) async {
    try {
      final success = await LoginService.login(username: username, password: password);

      if (success) {
        final storedUsername = await LoginService.getUsername();
        if (storedUsername != null) {
          return {'username': storedUsername};
        } else {
          return {'message': 'Failed to store username'};
        }
      } else {
        return {'message': 'Login failed'};
      }
    } catch (e) {
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
      return await RegisterService.register(
        username: username,
        email: email,
        password: password,
      );
    } catch (e) {
      return null;
    }
  }
}
