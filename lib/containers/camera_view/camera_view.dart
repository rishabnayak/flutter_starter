import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_starter/main.dart';

class CameraView extends StatefulWidget {
  @override
  CameraViewState createState() {
    return new CameraViewState();
  }
}

class CameraViewState extends State<CameraView> {
  bool _isDetecting = false;
  CameraController controller;
  bool isListening = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  _initCamera() async {
    controller = CameraController(
        cameras[0],
        defaultTargetPlatform == TargetPlatform.iOS
            ? ResolutionPreset.low
            : ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
      controller.startImageStream((CameraImage image) {
        if (_isDetecting) return;
        _isDetecting = true;
      });
    });
  }

  _cameraPreview() {
    return CameraPreview(controller);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return new Container();
    }
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Positioned.fill(
          child: new Transform.scale(
            scale: controller.value.aspectRatio / deviceRatio,
            child: Center(
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: _cameraPreview(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
