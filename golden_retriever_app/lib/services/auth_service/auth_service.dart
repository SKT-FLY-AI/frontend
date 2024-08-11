// lib/services/auth_service/auth_service.dart

import 'package:http/http.dart' as http;
import 'login_service.dart';
import 'register_service.dart';

class AuthService {
  static Future<http.Response?> login({
    required String username,
    required String password,
  }) {
    return LoginService.login(username: username, password: password);
  }

  static Future<http.Response?> register({
    required String username,
    required String password,
  }) {
    return RegisterService.register(username: username, password: password);
  }
}
