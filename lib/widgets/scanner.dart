import 'dart:async';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image/image.dart' as img;
import 'scroll_menu.dart';

import 'detector_painters.dart';
import 'image_editor.dart';
import '../store/edited_image.dart';

// Main Scanner class
class PictureScanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PictureScannerState();
}

// Scanner class local state
class _PictureScannerState extends State<PictureScanner> {
  File _imageFile; // The selected image
  Size _imageSize; // The image size
  dynamic _scanResults;

  final FaceDetector _faceDetector = FirebaseVision.instance.faceDetector(
    FaceDetectorOptions(
      enableContours: true,
      mode: FaceDetectorMode.fast,
    ),
  );

  Future<void> _getAndScanImage() async {
    setState(() {
      _imageFile = null;
      _imageSize = null;
    });
    final EditedImage imageStore = GetIt.I<EditedImage>();
    final File imageFile = imageStore.ogImage;

    if (imageFile != null) {
      _scanImage(imageFile);
    }

    setState(() {
      _imageFile = imageFile;
      _imageSize = imageStore.size;
    });
  }

  Future<void> _scanImage(File imageFile) async {
    setState(() {
      _scanResults = null;
    });
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(imageFile);

    dynamic results = await _faceDetector.processImage(visionImage);
    print(results.toString());
    setState(() {
      _scanResults = results;
    });
  }

  onPressedFunc() {
    print('smash');
    _getAndScanImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picture Scanner'),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: CustomPaint(
              painter: FaceDetectorContour(_imageSize, _scanResults),
            ),
          ),
          Expanded(
            child: Container(
              alignment: AlignmentDirectional.center,
              child: CircleImages(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressedFunc(),
        tooltip: 'Re-Scan',
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void dispose() {
    _faceDetector.close();
    super.dispose();
  }
}
