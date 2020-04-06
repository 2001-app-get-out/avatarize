import 'dart:ui' as ui;
import 'dart:developer' as dev;
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
            child: Column(children: [ImageEditor()]),
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
          return CustomPaint(
            painter: ImagePainter(
                image: image.uiImage,
                screenSize: Size(width, height),
                avatar: image),
            size: Size(width, width),
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
  ui.Size screenSize; //size of the screen
  EditedImage avatar;
  ImagePainter({@required this.image, this.screenSize, this.avatar});

  @override
  void paint(Canvas canvas, Size size) {
    // print(image.toString());
    // print(screenSize.toString());
    // print(avatar.size.toString());
    canvas.drawImageRect(
        image,
        Rect.fromLTWH(0, 0, avatar.size.width, avatar.size.width),
        Rect.fromLTWH(0, 0, size.width.toDouble(), size.width.toDouble()),
        Paint());
  }

  @override
  bool shouldRepaint(ImagePainter old) => (image != old.image);
}
