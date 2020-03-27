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

    var png = encodePng(editedImage);

    File save = new File('${directory.path}/$now.png');

    await save.create().then((File file) {
      file.writeAsBytesSync(encodePng(editedImage));
    });

    File save2 = new File('${directory.path}/second_$now.png');
    await save2.create();
    save2.writeAsBytesSync(png);
    print('completed!');
  } catch (e) {
    print('Error saving image: $e');
    developer.log('Error saving image: $e');
  }
}
