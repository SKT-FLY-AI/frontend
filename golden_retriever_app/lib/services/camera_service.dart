// lib/services/camera_service.dart

import 'package:camera/camera.dart';

Future<List<CameraDescription>> getAvailableCameras() async {
  try {
    return await availableCameras();
  } catch (e) {
    throw Exception('Error retrieving available cameras: $e');
  }
}

Future<CameraController> initializeCameraController(
    List<CameraDescription> cameras,
    bool isRearCameraSelected,
    ) async {
  final cameraIndex = isRearCameraSelected ? 0 : 1;

  if (cameraIndex >= cameras.length) {
    throw Exception('Selected camera index is out of range.');
  }

  final cameraController = CameraController(
    cameras[cameraIndex],
    ResolutionPreset.high,
  );

  try {
    await cameraController.initialize();
  } catch (e) {
    throw Exception('Error initializing camera controller: $e');
  }

  return cameraController;
}

Future<XFile> takePictureWithController(CameraController controller) async {
  try {
    return await controller.takePicture();
  } catch (e) {
    throw Exception('Error taking picture: $e');
  }
}
