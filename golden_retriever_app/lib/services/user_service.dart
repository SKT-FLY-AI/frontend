// lib/services/user_service.dart

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserService {
  static final FlutterSecureStorage _storage = FlutterSecureStorage();

  /// Fetches the username from the backend API using the stored access token.
  static Future<String?> fetchUsername() async {
    try {
      // Retrieve the access token from secure storage
      String? accessToken = await _storage.read(key: 'access_token');

      if (accessToken == null) {
        print('No access token found. User might not be logged in.');
        return null;
      }

      final response = await http.get(
        Uri.parse('http://223.194.44.32:8000/users/users'), // Corrected the URL
        headers: {
          'Authorization': 'Bearer $accessToken', // Include the authorization header with the token
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['username']; // Adjust this based on the actual response structure
      } else {
        print('Failed to load username, status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching username: $e');
      return null;
    }
  }
}
