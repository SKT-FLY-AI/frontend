// lib/screens/capture_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'image_view.dart';

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

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: isCameraInitialized && controller != null
          ? Stack(
              children: [
                Positioned.fill(
                  child: AspectRatio(
                    aspectRatio: controller!.value.aspectRatio,
                    child: CameraPreview(controller!),
                  ),
                ),
                Positioned(
                  top: 16.0,
                  left: 16.0,
                  child: CupertinoButton(
                    child: const Icon(CupertinoIcons.back),
                    onPressed: () {
                      widget.tabController.index = 0; // 홈 탭으로 돌아가기
                    },
                  ),
                ),
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // 양쪽 정렬
                    children: [
                      CupertinoButton(
                        child: const Icon(CupertinoIcons.photo),
                        onPressed: openGallery, // 갤러리 열기 로직 연결
                      ),
                      CupertinoButton(
                        child: const Icon(
                          CupertinoIcons.camera,
                          size: 64,
                          color: CupertinoColors.activeOrange,
                        ),
                        onPressed: () async {
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
                        },
                      ),
                      CupertinoButton(
                        child: const Icon(CupertinoIcons.arrow_2_circlepath),
                        onPressed: toggleCamera,
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const Center(
              child: CupertinoActivityIndicator(),
            ),
    );
  }
}