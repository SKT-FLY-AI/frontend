import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../server_config.dart';

class RegisterService {
  static Future<http.Response?> register({
    required String username,
    required String email,
    required String password,
    required int usersex,
  }) async {
    final url = Uri.parse('$serverUrl/users/signup');
    final body = json.encode({
      'username': username,
      'email': email,
      'password': password,
      'usersex': usersex,
    });

    try {
      final response = await _postRequest(url, body);
      _logResponse(response);
      return response;
    } catch (e) {
      _logError('Error during registration', e);
      return null;
    }
  }

  // HTTP POST 요청 전송을 위한 비공개 메서드
  static Future<http.Response> _postRequest(Uri url, String body) async {
    return await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
  }

  // 응답을 로깅하는 비공개 메서드
  static void _logResponse(http.Response response) {
    print('회원가입 응답: ${response.statusCode}');
    print('회원가입 응답 본문: ${response.body}');
  }

  // 오류를 로깅하는 메서드
  static void _logError(String message, Object error) {
    print('$message: $error');
  }
}