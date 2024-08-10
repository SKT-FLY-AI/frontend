import 'dart:io';
import 'package:http/http.dart' as http;

Future<http.StreamedResponse> sendImageUploadRequest(String filePath) async {
  File file = File(filePath);
  String fileName = file.uri.pathSegments.last;

  var request = http.MultipartRequest(
    'POST',
    Uri.parse('http://10.0.2.2:3001/images/upload/'), // Mock server URL
  );

  request.files.add(
    http.MultipartFile(
      'file',
      file.readAsBytes().asStream(),
      file.lengthSync(),
      filename: fileName,
    ),
  );

  return await request.send();
}
