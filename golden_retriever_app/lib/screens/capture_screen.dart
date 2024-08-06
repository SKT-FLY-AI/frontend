import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CaptureScreen extends StatefulWidget {
  const CaptureScreen({super.key});

  @override
  _CaptureScreenState createState() => _CaptureScreenState();
}

class _CaptureScreenState extends State<CaptureScreen> {
  CameraController? controller;
  List<CameraDescription> cameras = [];
  
  @override
  void initState() {
    super.initState();
    availableCameras().then((availableCameras) {
      cameras = availableCameras;
      if (cameras.isNotEmpty) {
        controller = CameraController(cameras[0], ResolutionPreset.high);
        controller?.initialize().then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller!.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capture Image'),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: controller!.value.aspectRatio,
            child: CameraPreview(controller!),
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () async {
              try {
                final image = await controller!.takePicture();
                // 여기서 image.path를 사용하여 이미지를 저장하거나 업로드할 수 있습니다.
              } catch (e) {
                print(e);
              }
            },
          ),
        ],
      ),
    );
  }
}
