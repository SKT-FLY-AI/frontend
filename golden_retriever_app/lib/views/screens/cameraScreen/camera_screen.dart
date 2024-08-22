// lib/views/screens/capture_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'components/camera_service.dart';
import 'components/gallery_service.dart';
import 'components/camera_top_bar.dart';
import 'components/camera_view.dart';
import 'image_preview.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key,});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? controller;
  bool isCameraInitialized = false;
  bool isRearCameraSelected = false;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await getAvailableCameras();
      controller = await initializeCameraController(cameras, isRearCameraSelected);
      if (!mounted) return;
      setState(() {
        isCameraInitialized = true;
      });
    } catch (e) {
      _handleCameraError(e);
    }
  }

  void _handleCameraError(dynamic e) {
    print('Error initializing camera: $e');
    // Optionally, show an error message or a dialog to the user.
  }

  void _toggleCamera() {
    setState(() {
      isRearCameraSelected = !isRearCameraSelected;
    });
    _initializeCamera();
  }

  Future<void> _openGallery() async {
    try {
      final pickedFile = await pickImageFromGallery(_picker);
      if (pickedFile != null && mounted) {
        _navigateToImageView(pickedFile.path);
      }
    } catch (e) {
      _handleGalleryError(e);
    }
  }

  void _handleGalleryError(dynamic e) {
    print('Error picking image: $e');
    // Optionally, show an error message or a dialog to the user.
  }

  Future<void> _takePicture() async {
    try {
      final image = await takePictureWithController(controller!);
      if (!mounted) return;
      _navigateToImageView(image.path);
    } catch (e) {
      _handleCaptureError(e);
    }
  }

  void _handleCaptureError(dynamic e) {
    print('Error taking picture: $e');
    // Optionally, show an error message or a dialog to the user.
  }

  void _navigateToImageView(String imagePath) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => ImagePreview(
          imagePath: imagePath,
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
      navigationBar: CameraTopBar(),
      child: _buildCameraView(),
    );
  }

  Widget _buildCameraView() {
    if (isCameraInitialized && controller != null) {
      return CameraView(
        controller: controller!,
        onOpenGallery: _openGallery,
        onTakePicture: _takePicture,
        onToggleCamera: _toggleCamera,
      );
    } else {
      return const Center(child: CupertinoActivityIndicator());
    }
  }
}
