import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:test_flutter/store/edited_image.dart';

Future<Null> cropImage() async {
  print("inside crop function");
  EditedImage editedImage = GetIt.I<EditedImage>();
  print('image filepath: ' + editedImage.ogFilepath.path);
  File croppedFile = await ImageCropper.cropImage(
    sourcePath: editedImage.ogFilepath.path,
    aspectRatioPresets: Platform.isAndroid
        ? [
            CropAspectRatioPreset.square,
          ]
        : [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
          ],
    androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Cropper',
        toolbarColor: Colors.lightBlue,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: true),
    iosUiSettings: IOSUiSettings(
      title: 'Cropper',
    ),
  );

  editedImage.cropTo(croppedFile);
}
