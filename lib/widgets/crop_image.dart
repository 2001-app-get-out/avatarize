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
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ]
        : [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio5x3,
            CropAspectRatioPreset.ratio5x4,
            CropAspectRatioPreset.ratio7x5,
            CropAspectRatioPreset.ratio16x9
          ],
    androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Cropper',
        toolbarColor: Colors.lightBlue,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false),
    iosUiSettings: IOSUiSettings(
      title: 'Cropper',
    ),
  );

  editedImage.cropTo(croppedFile);
}
