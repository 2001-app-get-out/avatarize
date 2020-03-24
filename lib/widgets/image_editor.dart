import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'package:test_flutter/store/edited_image.dart';

class ImageEditorPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("edit image"),
      ),
      body: Column(children: [
        AspectRatio(
          aspectRatio: 1,
          child: ImageEditor(),
        ),
      ]),
    );
  }
}

class ImageEditor extends StatelessWidget {
  Widget build(BuildContext context) {
    final image = GetIt.I<EditedImage>();

    if (!image.isRendered) {
      return Center(
        child: Text("check back later"),
      );
    } else {
      return ImageViewer(image: image);
    }
  }
}

class ImageViewer extends StatelessWidget {
  final EditedImage image;

  ImageViewer({@required this.image});

  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        _dummyObservations();
        return CustomPaint(
          painter: ImagePainter(image: image),
        );
      },
    );
  }

  void _dummyObservations() {
    // I don't know the right way to watch observables in a CustomPainter.
    // This probably isn't it, but just leaving it out doesn't work either.
    var _rect = image.crop.rect;
    var _uiImage = image.uiImage;
    // developer.log("observing _rect:" + _rect.toString());
    // developer.log("observing _uiImage width " + _uiImage.width.toString());
  }
}

class ImagePainter extends CustomPainter {
  EditedImage image;

  ImagePainter({@required this.image});

  @override
  void paint(Canvas canvas, Size size) {
    if (image.isRendered) {
      var src = image.crop.rect;
      var dst = Rect.fromLTRB(0, 0, size.width, size.height);
      // developer.log('painting src ' + src.toString());
      // developer.log('painting dst ' + dst.toString());
      canvas.drawImageRect(image.uiImage, src, dst, Paint());
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
