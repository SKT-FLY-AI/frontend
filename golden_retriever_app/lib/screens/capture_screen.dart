// capture_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:camera/camera.dart';

class CaptureScreen extends StatefulWidget {
  const CaptureScreen({super.key});

  @override
  _CaptureScreenState createState() => _CaptureScreenState();
}

class _CaptureScreenState extends State<CaptureScreen> {
  CameraController? controller;
  List<CameraDescription> cameras = [];
  bool isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        controller = CameraController(cameras[0], ResolutionPreset.high);
        await controller?.initialize();
        if (!mounted) return;
        setState(() {
          isCameraInitialized = true;
        });
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Capture Image'),
      ),
      child: isCameraInitialized && controller != null
          ? Column(
              children: [
                AspectRatio(
                  aspectRatio: controller!.value.aspectRatio,
                  child: CameraPreview(controller!),
                ),
                CupertinoButton(
                  child: const Icon(CupertinoIcons.camera),
                  onPressed: () async {
                    try {
                      final image = await controller!.takePicture();
                      // 여기서 image.path를 사용하여 이미지를 저장하거나 업로드할 수 있습니다.
                      print('Picture taken: ${image.path}');
                    } catch (e) {
                      print('Error taking picture: $e');
                    }
                  },
                ),
              ],
            )
          : const Center(
              child: CupertinoActivityIndicator(),
            ),
    );
  }
}
