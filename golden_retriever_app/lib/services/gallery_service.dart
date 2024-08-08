// lib/services/gallery_service.dart

import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImageFromGallery(ImagePicker picker) async {
  return await picker.pickImage(source: ImageSource.gallery);
}