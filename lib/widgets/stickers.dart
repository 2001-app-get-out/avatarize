import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'dart:ui';

import 'image_editor.dart';
import './sticker_view.dart';
import '../store/edited_image.dart';

// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'scroll_menu.dart';

class Stickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StickerView();
  }
}

class StickerView extends StatefulWidget {
  @override
  _StickerViewState createState() => _StickerViewState();
}

class _StickerViewState extends State<StickerView> {
  @override
  Widget build(BuildContext context) {
    var imageStore = GetIt.I<EditedImage>();
    // Image uiImage = imageStore.uiImage;
    var _stickerView = FlutterSimpleStickerView(
      Container(
        child: ImageEditor(),
        // child: Image.memory(imageStore.finalImage.getBytes()),
        // decoration: BoxDecoration(
        //   color: Colors.red,
        //   image: DecorationImage(
        //     fit: BoxFit.cover,
        //     image: uiImage,
        //   ),
        // ),
      ),
      [
        Image.asset("graphics/anime_parts_019_o.png"),
        Image.asset("graphics/anime_parts_020_o.png"),
        Image.asset("graphics/anime_parts_021_o.png"),
        Image.asset("graphics/anime_parts_022_o.png"),
        Image.asset("graphics/anime_parts_030_o.png"),
        Image.asset("graphics/anime_parts_031_o.png"),
        Image.asset("graphics/anime_parts_032_o.png"),
        Image.asset("graphics/anime_parts_033_o.png"),
        Image.asset("graphics/anime_parts_036_o.png"),
        Image.asset("graphics/anime_parts_037_o.png"),
        
      ],
      panelHeight: 150,
      panelBackgroundColor: Colors.blue,
      panelStickerBackgroundColor: Colors.pink,
      panelStickercrossAxisCount: 4,
      panelStickerAspectRatio: 1.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Simple Sticker View"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.check),
              onPressed: () async {
                Uint8List image = await _stickerView.exportImage();
                var newImage = img.decodeImage(image);
                print(newImage.toString());
                imageStore.draftImage = img.decodeImage(image);
              }),
        ],
      ),
      body: _stickerView,
      // bottomNavigationBar: MenuWidget(),
    );
  }
}
