import 'dart:ui' as ui;

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_flutter/store/face.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image/image.dart' as img;
import 'scroll_menu.dart';

import 'detector_painters.dart';
import 'image_editor.dart';
import '../store/edited_image.dart';

<<<<<<< Updated upstream
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

  // The instance of the FaceDetector class
  final FaceDetector _faceDetector = FirebaseVision.instance.faceDetector(
    FaceDetectorOptions(enableContours: true, mode: FaceDetectorMode.fast),
  );

  Future<void> _getAndScanImage() async {
    setState(() {
      _imageFile = null;
      _imageSize = null;
    });

    final File imageFile = 

    if (imageFile != null) {
      _getImageSize(imageFile);
      _scanImage(imageFile);
    }

    setState(() {
      _imageFile = imageFile;
    });
  }

  Future<void> _getImageSize(File imageFile) async {
    final Completer<Size> completer = Completer<Size>();

    final Image image = Image.file(imageFile);
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(Size(
          info.image.width.toDouble(),
          info.image.height.toDouble(),
        ));
      }),
    );

    final Size imageSize = await completer.future;
    setState(() {
      _imageSize = imageSize;
    });
  }


  Future<void> _scanImage(File imageFile) async {
    setState(() {
      _scanResults = null;
    });

    // Converts image file into FireBaseVisionImage that ML Kit can read
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(imageFile);

    // Saves results of scan to variable and saves to local state
    dynamic results = await _faceDetector.processImage(visionImage);
    setState(() {
      _scanResults = results;
    });
  }

  CustomPaint _buildResults(Size imageSize, dynamic results) {
    CustomPainter painter = FaceDetectorPainter(_imageSize, results);

    return CustomPaint(
      painter: painter,
=======
final EditedImage imageStore = GetIt.I<EditedImage>();
final ScannedFace scannedFace = GetIt.I<ScannedFace>();

class PictureScanner extends StatelessWidget {
  final FaceDetector _faceDetector = FirebaseVision.instance.faceDetector(
    FaceDetectorOptions(
      enableContours: true,
      mode: FaceDetectorMode.fast,
    ),
  );

  Widget _buildImage(BuildContext context) {
    return Observer(
      builder: (context) {
        return Container(
          child: CustomPaint(
            painter: FaceDetectorSquare(),
          ),
        );
      },
>>>>>>> Stashed changes
    );
  }

  onPressedFunc() {
    print('smash');
    final newNew = scannedFace.ogImageFile;
    scannedFace.loadFile(newNew);
  }

  @override
  Widget build(BuildContext context) {
    final ui.Image finalImage = imageStore.uiImage;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picture Scanner'),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: _buildImage(context),
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
<<<<<<< Updated upstream

    super.dispose();
=======
  }
}

class FaceDetectorSquare extends CustomPainter {
  Size absoluteImageSize;
  List<Face> faces;

  FaceDetectorSquare({this.absoluteImageSize, this.faces});

  @override
  void paint(Canvas canvas, Size size) {
    if (absoluteImageSize = null) absoluteImageSize = imageStore.size;
    if (faces = null) faces = scannedFace.scannedFaces;

    final double scaleX = size.width / absoluteImageSize.width;
    final double scaleY = size.height / absoluteImageSize.height;

    for (Face face in faces) {
      canvas.drawRect(
        Rect.fromLTRB(
          face.boundingBox.left * scaleX,
          face.boundingBox.top * scaleY,
          face.boundingBox.right * scaleX,
          face.boundingBox.bottom * scaleY,
        ),
        Paint(),
      );

      FaceContourType contour = FaceContourType.face;
      ui.PointMode pointMode = ui.PointMode.points;
      List<Offset> pointList = face.getContour(contour).positionsList;
      canvas.drawPoints(pointMode, pointList, Paint());
    }
  }

  @override
  bool shouldRepaint(FaceDetectorSquare old) {
    return old.absoluteImageSize != absoluteImageSize || old.faces != faces;
>>>>>>> Stashed changes
  }
}
