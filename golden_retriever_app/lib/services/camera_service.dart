// lib/services/camera_service.dart

import 'package:camera/camera.dart';

Future<List<CameraDescription>> getAvailableCameras() async {
  return await availableCameras();
}

Future<CameraController> initializeCameraController(List<CameraDescription> cameras, bool isRearCameraSelected) async {
  final cameraController = CameraController(
    cameras[isRearCameraSelected ? 0 : 1], // 전면 또는 후면 카메라 선택
    ResolutionPreset.high,
  );
  await cameraController.initialize();
  return cameraController;
}

Future<XFile> takePictureWithController(CameraController controller) async {
  return await controller.takePicture();
}