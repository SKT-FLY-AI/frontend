// lib/services/auth_service/auth_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../server_config.dart';
import 'login_service.dart';

class AuthService {
  static Future<int?> extractUserIdFromToken(String accessToken) async {
    try {
      // JWT는 세 부분으로 나뉘어져 있습니다: header, payload, signature
      final parts = accessToken.split('.');
      if (parts.length != 3) {
        throw Exception('Invalid token format');
      }

      // payload는 Base64로 인코딩되어 있습니다
      final payload = parts[1];
      final normalizedPayload = base64Url.normalize(payload);
      final decodedPayload = utf8.decode(base64Url.decode(normalizedPayload));

      final Map<String, dynamic> payloadMap = json.decode(decodedPayload);

      // 'sub' 키의 타입이 String 또는 int일 수 있음
      final userId = payloadMap['sub'];
      print('userId: $userId, type: ${userId.runtimeType}');

      if (userId is String) {
        return int.tryParse(userId);  // String을 int로 변환
      } else if (userId is int) {
        return userId;  // 이미 int 타입인 경우 그대로 반환
      } else {
        throw Exception('Unexpected type for user ID: ${userId.runtimeType}');
      }
    } catch (e) {
      print('Failed to decode JWT: $e');
      return null;
    }
  }

  static Future<void> getUserInfo(int? userId) async {
    final accessToken = await LoginService.storage.read(key: 'access_token'); // 저장된 토큰 읽기
    final url = Uri.parse('$serverUrl/users/$userId');

    try {
      print('getUserInfo 요청 시작: userId=$userId');
      print('accessToken: $accessToken');
      print('요청 URL: $url');

      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $accessToken', // 토큰 포함
          'Content-Type': 'application/json',
        },
      );

      print('응답 상태 코드: ${response.statusCode}');

      if (response.statusCode == 200) {
        print('User Info 응답 데이터 처리 중...');

        // UTF-8로 인코딩된 응답 본문 디코딩
        final decodedBody = utf8.decode(response.bodyBytes);
        print('디코딩된 응답 본문: $decodedBody');

        // JSON 응답을 Map으로 변환
        final Map<String, dynamic> userInfo = jsonDecode(decodedBody);

        final String? username = userInfo['username'] as String?;
        final int? usersex = userInfo['usersex'] as int?;

        // 각각의 변수를 StorageService를 통해 저장
        await LoginService.storage.write(key: 'username', value: username);
        await LoginService.storage.write(key: 'usersex', value: usersex.toString());

        print('User Info 저장 성공: username=${userInfo['username']}, email=${userInfo['email']}, usersex=${userInfo['usersex']}');

      } else {
        print('User Info 로딩 실패. Status code: ${response.statusCode}');
        print('응답 본문: ${response.body}');
      }
    } catch (e) {
      print('에러 발생: $e');
    }
  }
}
