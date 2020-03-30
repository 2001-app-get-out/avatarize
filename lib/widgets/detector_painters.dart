import 'dart:ui';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../store/edited_image.dart';

enum Detector { face }

final image = GetIt.I<EditedImage>();
final ogFile = image.ogImage;

class FaceDetectorSquare extends CustomPainter {
  FaceDetectorSquare(this.absoluteImageSize, this.faces);

  final Size absoluteImageSize;
  final List<Face> faces;

  @override
  void paint(Canvas canvas, Size size) {
    print(canvas.toString());
    print(size.toString());

    final double scaleX = size.width / absoluteImageSize.width;
    final double scaleY = size.height / absoluteImageSize.height;

    final Paint painter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..color = Colors.red;

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
    }
  }

  @override
  bool shouldRepaint(FaceDetectorSquare oldDelegate) {
    return oldDelegate.absoluteImageSize != absoluteImageSize ||
        oldDelegate.faces != faces;
  }
}

class FaceDetectorContour extends CustomPainter {
  FaceDetectorContour(this.absoluteImageSize, this.faces);

  final Size absoluteImageSize;
  final List<Face> faces;

  @override
  void paint(Canvas canvas, Size size) {
    print(canvas.toString());
    print(size.toString());
    final double scaleX = size.width / absoluteImageSize.width;
    final double scaleY = size.height / absoluteImageSize.height;

    final Paint painter = Paint()
      ..strokeWidth = 50
      ..style = PaintingStyle.fill
      ..color = Colors.red;

    final FaceContourType contour = FaceContourType.allPoints;

    for (Face face in faces) {
      List<Offset> pointList = face.getContour(contour).positionsList;
      int count = 0;
      print(count.toString());
      print('LENGTH: ' + pointList.length.toString());
      for (Offset off in pointList) {
        count++;
        off = off.scale(scaleX, scaleY);
        print(count.toString() + ': ' + off.toString());
        canvas.drawCircle(off, 2, painter);
      }
      print('finished:' + count.toString());
      canvas.drawPoints(PointMode.points, pointList, painter);
    }
  }

  @override
  bool shouldRepaint(FaceDetectorContour oldDelegate) {
    return oldDelegate.absoluteImageSize != absoluteImageSize ||
        oldDelegate.faces != faces;
  }
}
