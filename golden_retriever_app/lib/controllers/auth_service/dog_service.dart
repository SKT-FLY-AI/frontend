import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../server_config.dart';
import 'login_service.dart';

class DogService {
  static Future<http.Response?> registerDog({
    required String dogName,
    required int dogAge,
    required int dogSex,
    required bool dogSpayed,
    required bool dogPregnant,
    required int userId, // userID 추가
  }) async {
    final url = Uri.parse('$serverUrl/users/dogs/');
    final body = json.encode({
      'dog_name': dogName,
      'dog_age': dogAge,
      'dog_sex': dogSex,
      'dog_spayed': dogSpayed,
      'dog_pregnant': dogPregnant,
      'owner_id': userId,  // userID 추가
    });

    try {
      String? accessToken = await LoginService.storage.read(key: 'access_token');
      if (accessToken == null) {
        throw Exception('Access token is missing');
      }

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        print("Dog registered successfully.");
      } else {
        print("Failed to register dog: ${response.reasonPhrase}");
      }

      return response;
    } catch (e) {
      print('Error during dog registration: $e');
      return null;
    }
  }

// 다른 DogService 메서드들 (강아지 조회, 수정, 삭제 등)

  // 모든 강아지 정보를 가져오는 메서드
  static Future<List<Map<String, dynamic>>?> fetchAllDogs() async {
    final url = Uri.parse('$serverUrl/users/dogs/');

    try {
      String? accessToken = await LoginService.storage.read(key: 'access_token');
      if (accessToken == null) {
        throw Exception('Access token is missing');
      }

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> dogData = json.decode(response.body);
        return dogData.cast<Map<String, dynamic>>();
      } else {
        print("Failed to fetch dogs: ${response.reasonPhrase}");
        return null;
      }
    } catch (e) {
      print('Error fetching dogs: $e');
      return null;
    }
  }

}
