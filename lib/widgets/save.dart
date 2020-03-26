import 'dart:io';
import 'dart:developer' as developer;

import 'package:path_provider/path_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:image/image.dart' as img;

import 'package:test_flutter/store/edited_image.dart';

void savePng() async {
  developer.log("Inside save function");
  img.Image editedImage = GetIt.I<EditedImage>().finalImage;

  String title = "image";

  try {

    developer.log('inside try');
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$title.png');

    developer.log(file.toString());
    file.writeAsBytesSync(img.encodePng(editedImage));
  } catch (e) {
    developer.log('Error saving image: $e');
  }
}
