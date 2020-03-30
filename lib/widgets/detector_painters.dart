import 'dart:ui';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../store/edited_image.dart';
import '../store/face.dart';

enum Detector { face }

final image = GetIt.I<EditedImage>();
final scannedFaces = GetIt.I<ScannedFace>();

class FaceDetectorSquare extends CustomPainter {
  FaceDetectorSquare(this.absoluteImageSize, this.faces);

  final Size absoluteImageSize;
  final List<Face> faces;

  @override
  void paint(Canvas canvas, Size size) {
    final double scaleX = size.width / absoluteImageSize.width;
    final double scaleY = size.height / absoluteImageSize.height;

    final Paint painter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..color = Colors.red;

    final PointMode pointMode = PointMode.points;
    final FaceContourType contour = FaceContourType.face;


    for (Face face in faces) {
      canvas.drawRect(
        Rect.fromLTRB(
          face.boundingBox.left * scaleX,
          face.boundingBox.top * scaleY,
          face.boundingBox.right * scaleX,
          face.boundingBox.bottom * scaleY,
        ),
        painter,
      );

      List<Offset> pointList = face.getContour(contour).positionsList;

      for (Offset off in pointList) {
        print('OLD: ' + off.toString());
        off.scale(scaleX, scaleY);
        print('NEW: ' + off.toString());
      }

      canvas.drawPoints(pointMode, pointList, painter);
    }
  }

  @override
  bool shouldRepaint(FaceDetectorSquare oldDelegate) {
    return oldDelegate.absoluteImageSize != absoluteImageSize ||
        oldDelegate.faces != faces;
  }
}

class FaceDetectorContour extends CustomPainter {
  final Size size = image.size;
  final face = scannedFaces.selectedFace;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint painter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..color = Colors.red;

    final PointMode pointMode = PointMode.points;
    final FaceContourType contour = FaceContourType.allPoints;

    List<Offset> pointList = face.getContour(contour).positionsList;
    canvas.drawPoints(pointMode, pointList, painter);
  }

  @override
  bool shouldRepaint(FaceDetectorContour oldDelegate) {
    return false;
  }
}
