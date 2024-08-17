// lib/services/auth_service/login_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../server_config.dart';
import 'auth_service.dart';

class LoginService {
  static final FlutterSecureStorage storage = FlutterSecureStorage();

  static Future<Map<String, dynamic>?> login({
    required String email,
    required String password,
  }) async {
    try {
      print('로그인 요청 시작: 이메일=$email');

      final url = Uri.parse('$serverUrl/users/login');
      print('로그인 요청 URL: $url');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );
      print('로그인 요청에 대한 응답 상태 코드: ${response.statusCode}');

      if (response.statusCode == 200) {
        print('로그인 성공, 응답 데이터 처리 중...');
        final data = json.decode(response.body) as Map<String, dynamic>;
        final accessToken = data['access_token'];
        print('액세스 토큰 획득: $accessToken');

        await storage.write(key: 'email', value: email);
        await storage.write(key: 'password', value: password);
        await storage.write(key: 'access_token', value: accessToken);
        print('스토리지에 로그인 정보 저장 완료');

        // accessToken을 가지고 user_id 추출 및 사용자 정보 가져오기
        final userId = await AuthService.extractUserIdFromToken(accessToken);
        print('추출된 user_id: $userId');

        if (userId != null) {
          print('user_id가 유효합니다. 사용자 정보 가져오기 시도...');
          await AuthService.getUserInfo(userId);

          // 저장된 username 읽기
          final username = await storage.read(key: 'username');
          print('로그인된 사용자 이름: $username');
        } else {
          print('user_id 추출 실패. 로그인 절차 중단');
        }

        return data;
      } else {
        print('로그인 실패: 상태 코드=${response.statusCode}, 사유=${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('로그인 도중 에러가 발생했습니다: $e');
      return null;
    }
  }
}
