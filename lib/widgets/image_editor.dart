import 'dart:ui' as ui;
// import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'scroll_menu.dart';

import 'package:test_flutter/store/edited_image.dart';

class ImageEditorPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Image"),
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
            child: MenuWidget(),
          ),
        ],
      ),
    );
  }
}

class ImageEditor extends StatelessWidget {
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print('Media queries' + width.toString() + ", " + height.toString());
    final image = GetIt.I<EditedImage>(); // Gets image from store
    print('Image size: ' + image.size.toString());
    return Observer(
      builder: (context) {
        if (image.isRendered) {
          return Expanded(
            //
            child: CustomPaint(
              painter: ImagePainter(
                image: image.uiImage,
                size: Size(width, width),
              ),
              size: Size(width, width),
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
  ui.Size size;
  ImagePainter({@required this.image, this.size});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(image, Offset(0.0, 0.0), Paint());
  }

  @override
  bool shouldRepaint(ImagePainter old) => (image != old.image);
}
