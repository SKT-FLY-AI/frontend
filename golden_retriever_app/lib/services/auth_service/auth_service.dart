// // lib/services/auth_service/auth_service.dart
//
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../../server_config.dart';
// import 'login_service.dart';
//
// class AuthService {
//   static Future<int?> extractUserIdFromToken(String accessToken) async {
//     try {
//       final payload = accessToken.split('.')[1];
//       final normalizedPayload = base64Url.normalize(payload);
//       final decodedPayload = utf8.decode(base64Url.decode(normalizedPayload));
//       final payloadMap = json.decode(decodedPayload);
//
//       final userId = payloadMap['sub'];
//       if (userId is String) return int.tryParse(userId);
//       if (userId is int) return userId;
//
//       throw Exception('Unexpected user ID type');
//     } catch (e) {
//       print('Failed to decode JWT: $e');
//       return null;
//     }
//   }
//
//   static Future<String?> getUserName(int userId) async {
//     final accessToken = await LoginService.storage.read(key: 'access_token');
//     final url = Uri.parse('$serverUrl/users/$userId');
//
//     try {
//       final response = await http.get(
//         url,
//         headers: {
//           'Authorization': 'Bearer $accessToken',
//           'Content-Type': 'application/json',
//         },
//       );
//
//       if (response.statusCode == 200) {
//         final userInfo = jsonDecode(utf8.decode(response.bodyBytes));
//         final username = userInfo['username'] as String?;
//         if (username != null) {
//           await LoginService.storage.write(key: 'username', value: username);
//         }
//         return username;
//       } else {
//         print('Failed to load user info: ${response.statusCode}');
//         return null;
//       }
//     } catch (e) {
//       print('Error fetching user info: $e');
//       return null;
//     }
//   }
// }



// lib/services/auth_service/auth_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../server_config.dart';
import 'login_service.dart';

class AuthService {
  static Future<int?> extractUserIdFromToken(String accessToken) async {
    try {
      print('Extracting user ID from token...');
      final payload = accessToken.split('.')[1];
      final normalizedPayload = base64Url.normalize(payload);
      final decodedPayload = utf8.decode(base64Url.decode(normalizedPayload));
      final payloadMap = json.decode(decodedPayload);

      final userId = payloadMap['sub'];
      print('Extracted user ID: $userId');

      if (userId is String) return int.tryParse(userId);
      if (userId is int) return userId;

      throw Exception('Unexpected user ID type');
    } catch (e) {
      print('Failed to decode JWT: $e');
      return null;
    }
  }

  static Future<String?> getUserName(int userId) async {
    final accessToken = await LoginService.storage.read(key: 'access_token');
    if (accessToken == null) {
      print('No access token found.');
      return null;
    }

    final url = Uri.parse('$serverUrl/users/$userId');
    print('Fetching user info for user ID: $userId from URL: $url');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
      );

      print('Received response: ${response.statusCode} - ${response.reasonPhrase}');

      if (response.statusCode == 200) {
        final userInfo = jsonDecode(utf8.decode(response.bodyBytes));
        final username = userInfo['username'] as String?;
        print('Username: $username');
        if (username != null) {
          await LoginService.storage.write(key: 'username', value: username);
          print('Username saved successfully.');
        }
        return username;
      } else {
        print('Failed to load user info: ${response.statusCode} - ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Error fetching user info: $e');
      return null;
    }
  }
}
