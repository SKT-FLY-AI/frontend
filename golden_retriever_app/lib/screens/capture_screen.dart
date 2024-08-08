// lib/screens/capture_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'image_view.dart';
import '../widgets/camera_preview_widget.dart';
import '../widgets/camera_controls_widget.dart';

class CaptureScreen extends StatefulWidget {
  final CupertinoTabController tabController;

  const CaptureScreen({super.key, required this.tabController});

  @override
  _CaptureScreenState createState() => _CaptureScreenState();
}

class _CaptureScreenState extends State<CaptureScreen> {
  CameraController? controller;
  List<CameraDescription> cameras = [];
  bool isCameraInitialized = false;
  bool isRearCameraSelected = false; // 전면 카메라 선택
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        controller = CameraController(
          cameras[isRearCameraSelected ? 0 : 1], // 전면 또는 후면 카메라 선택
          ResolutionPreset.high,
        );
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

  void toggleCamera() {
    setState(() {
      isRearCameraSelected = !isRearCameraSelected;
    });
    initializeCamera();
  }

  Future<void> openGallery() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ImageView(
              imagePath: pickedFile.path,
              tabController: widget.tabController,
            ),
          ),
        );
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> takePicture() async {
    try {
      final image = await controller!.takePicture();
      if (!mounted) return;
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => ImageView(
            imagePath: image.path,
            tabController: widget.tabController,
          ),
        ),
      );
    } catch (e) {
      print('Error taking picture: $e');
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
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.black,
        middle: const Text(
          'Camera',
          style: TextStyle(color: CupertinoColors.white),
        ),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.back, color: CupertinoColors.white),
          onPressed: () {
            widget.tabController.index = 0; // 홈 탭으로 돌아가기
          },
        ),
      ),
      child: isCameraInitialized && controller != null
          ? Stack(
              children: [
                CameraPreviewWidget(controller: controller!),
                CameraControlsWidget(
                  onOpenGallery: openGallery,
                  onTakePicture: takePicture,
                  onToggleCamera: toggleCamera,
                ),
              ],
            )
          : const Center(
              child: CupertinoActivityIndicator(),
            ),
    );
  }
}

