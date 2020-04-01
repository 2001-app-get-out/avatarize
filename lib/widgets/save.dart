import 'dart:io';
import 'dart:developer' as developer;

import 'package:path_provider/path_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:image/image.dart';

import 'package:test_flutter/store/edited_image.dart';

void savePng() async {
  print("Inside save function");
  developer.log("Inside save function");
  Image editedImage = GetIt.I<EditedImage>().finalImage;

  try {
    print('inside try');
    var now = new DateTime.now();
    final directory = await getApplicationDocumentsDirectory();

    File save = new File('${directory.path}/files/Pictures/$now.png');

    await save.create().then((File file) {
      file.writeAsBytesSync(encodePng(editedImage));
    });
    print('completed!');
  } catch (e) {
    print('Error saving image: $e');
    developer.log('Error saving image: $e');
  }
}
