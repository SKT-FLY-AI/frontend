// lib/services/image_upload_service.dart

import 'dart:io';
import 'package:http/http.dart' as http;
import 'auth_service/login_service.dart';
import '../../server_config.dart';

// 파일 경로(filePath)를 받아 이미지를 서버로 업로드하는 기능
Future<http.StreamedResponse> sendImageUploadRequest(String filePath) async {
  File file = File(filePath);
  String fileName = file.uri.pathSegments.last;

  // HTTP POST 요청 만들기
  var request = http.MultipartRequest(
    'POST',
    Uri.parse('$serverUrl/images/upload/'),
  );

  // 헤더 추가
  String? accessToken = await LoginService.storage.read(key: 'access_token');
  if (accessToken != null) {
    request.headers['Authorization'] = 'Bearer $accessToken';
  }

  // 파일을 요청에 추가
  request.files.add(
    http.MultipartFile(
      'file',
      file.readAsBytes().asStream(),
      file.lengthSync(),
      filename: fileName,
    ),
  );

  // 요청 전송
  return await request.send();
}
