import 'dart:ui';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';

enum Detector { face }

class FaceDetectorPainter extends CustomPainter {
  FaceDetectorPainter(this.absoluteImageSize, this.faces);

  final Size absoluteImageSize;
  final List<Face> faces;

  @override
  void paint(Canvas canvas, Size size) {

    final Paint paint = Paint()
      ..strokeWidth = 2.0
      ..color = Colors.red;

    final PointMode pointMode = PointMode.polygon;

    for (Face face in faces) {
      // for (FaceContourType type in types) {
      final List<Offset> pointList =
          face.getContour(FaceContourType.face).positionsList;
      canvas.drawPoints(pointMode, pointList, paint);
    }
  }

  @override
  bool shouldRepaint(FaceDetectorPainter oldDelegate) {
    return oldDelegate.absoluteImageSize != absoluteImageSize ||
        oldDelegate.faces != faces;
  }
}
