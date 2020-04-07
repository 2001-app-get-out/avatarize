import 'dart:developer' as developer;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image/image.dart' as img;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

import 'package:test_flutter/store/edited_image.dart';

void savePng() async {
  print("Inside save function");
  developer.log("Inside save function");
  img.Image editedImage = GetIt.I<EditedImage>().finalImage;
  // img.decodeImage(editedImage.getBytes());
  // print(editedImage.toString());
  try {
    print(await Permission.storage.status);
    if (await Permission.storage.request().isGranted) {
      print('inside try');
      var now = new DateTime.now();
      // final directory = await getApplicationDocumentsDirectory();
      // print(directory);
      final directory = await getExternalStorageDirectory();
      print(directory);
      await directory.create();
      Directory picturesFolder = Directory('${directory.path}/Pictures');
      await picturesFolder.create();

      print(picturesFolder);
      // var bytes = editedImage.getBytes();
      // if (bytes != null) {
      //   // Size size = Size(editedImage.width, editedImage.height);
      // final result = await ImageGallerySaver.saveImage(bytes);

      //   // print(result);
      // } else
      // print('something went wrong');

      File save = new File('${picturesFolder.path}/$now.png');
      await save.create().then((File file) {
        file.writeAsBytesSync(img.encodePng(editedImage));
      });

      print('completed!');
    }
  } catch (e) {
    print('Error saving image: $e');
    developer.log('Error saving image: $e');
  }
}
