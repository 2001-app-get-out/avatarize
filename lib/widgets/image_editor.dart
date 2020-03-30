import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'scroll_menu.dart';

import 'package:test_flutter/store/edited_image.dart';

class ImageEditorPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("edit image"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Show Snackbar',
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: ImageEditor(),
          ),
          Expanded(
            child: Container(
              alignment: AlignmentDirectional.center,
              child: CircleImages(),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageEditor extends StatelessWidget {
  Widget build(BuildContext context) {
    final image = GetIt.I<EditedImage>(); // Gets image from store
    return Observer(
      builder: (context) {
        if (image.isRendered) {
          return ImageScaler(
            image: image,
            child: CustomPaint(
              painter: ImagePainter(
                image: image.uiImage,
                rect: image.crop,
              ),
            ),
          );
        } else {
          return Center(child: Text("loading"));
        }
      },
    );
  }
}

class ImagePainter extends CustomPainter {
  ui.Image image;
  Rect rect;

  ImagePainter({@required this.image, @required this.rect});

  @override
  void paint(Canvas canvas, Size size) {
    var src = rect;
    var dst = Rect.fromLTRB(0, 0, size.width, size.height);
    // developer.log('painting src ' + src.toString());
    // developer.log('painting dst ' + dst.toString());
    canvas.drawImageRect(image, src, dst, Paint());
  }

  @override
  bool shouldRepaint(ImagePainter old) =>
      (image != old.image || rect != old.rect);
}

class ImageScaler extends StatefulWidget {
  final EditedImage image;
  final Widget child;

  ImageScaler({@required this.image, @required this.child});

  @override
  _ImageScalerState createState() {
    return _ImageScalerState();
  }
}

// Contains image gesture detector to set size changes to state
class _ImageScalerState extends State<ImageScaler> {
  Size _startingSize;

  Widget build(BuildContext context) {
    return GestureDetector(
      child: widget.child,
      onScaleStart: _onScaleStart,
      onScaleUpdate: _onScaleUpdate,
      onScaleEnd: _onScaleEnd,
    );
  }

  void _onScaleStart(ScaleStartDetails event) {
    // developer.log(event.toString());
    _startingSize = widget.image.crop.size;
  }

  void _onScaleUpdate(ScaleUpdateDetails event) {
    // developer.log(event.toString());

    widget.image.cropTo(Rect.fromLTWH(
      0,
      0,
      math.min(widget.image.smallerSide, _startingSize.width * event.scale),
      math.min(widget.image.smallerSide, _startingSize.height * event.scale),
    ));
  }

  void _onScaleEnd(ScaleEndDetails event) {
    // developer.log(event.toString());
  }
}
