// lib/screens/capture_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'image_view.dart';
import '../widgets/camera_view.dart';
import '../widgets/camera_top_bar.dart';
import '../services/camera_service.dart';
import '../services/gallery_service.dart';

class CaptureScreen extends StatefulWidget {
  final CupertinoTabController tabController;

  const CaptureScreen({super.key, required this.tabController});

  @override
  _CaptureScreenState createState() => _CaptureScreenState();
}

class _CaptureScreenState extends State<CaptureScreen> {
  CameraController? controller;
  bool isCameraInitialized = false;
  bool isRearCameraSelected = false;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    try {
      final cameras = await getAvailableCameras();
      controller = await initializeCameraController(cameras, isRearCameraSelected);
      if (!mounted) return;
      setState(() {
        isCameraInitialized = true;
      });
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
      final pickedFile = await pickImageFromGallery(_picker);
      if (pickedFile != null && mounted) {
        navigateToImageView(pickedFile.path);
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> takePicture() async {
    try {
      final image = await takePictureWithController(controller!);
      if (!mounted) return;
      navigateToImageView(image.path);
    } catch (e) {
      print('Error taking picture: $e');
    }
  }

  void navigateToImageView(String imagePath) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => ImageView(
          imagePath: imagePath,
          tabController: widget.tabController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CameraTopBar(tabController: widget.tabController),
      child: isCameraInitialized && controller != null
          ? CameraView(
              controller: controller!,
              onOpenGallery: openGallery,
              onTakePicture: takePicture,
              onToggleCamera: toggleCamera,
            )
          : const Center(child: CupertinoActivityIndicator()),
    );
  }
}