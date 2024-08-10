// lib/services/gallery_service.dart

import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImageFromGallery(ImagePicker picker) async {
  try {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile;
  } catch (e) {
    throw Exception('Error picking image from gallery: $e');
  }
}
