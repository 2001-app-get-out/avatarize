import 'dart:async';
import 'dart:io';
import 'dart:developer' as developer;
import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:mobx/mobx.dart';
import 'package:image/image.dart';

import 'filter.dart';
// import 'decoration.dart';
// import 'adjustment.dart';

part 'edited_image.g.dart';

class EditedImage = _EditedImage with _$EditedImage;

abstract class _EditedImage with Store {
  @observable
  File ogFilepath;

  @observable
  Image baseImage;

  @observable
  Image draftImage;

  @observable
  ui.Size size;

  @computed
  double get smallerSide => math.min(size.width, size.height);

  @observable
  ui.Rect crop;

  @observable
  Filter filter;

  @computed
  ObservableFuture<ui.Image> get uiImageFuture {
    if (finalImage == null) {
      return ObservableFuture.value(null);
    }

    developer.log("recomputing ui image...");
    var completer = Completer<ui.Image>();

    ui.decodeImageFromPixels(
      finalImage.getBytes(),
      finalImage.width,
      finalImage.height,
      ui.PixelFormat.rgba8888,
      completer.complete,
    );

    return completer.future.asObservable();
  }

  @computed
  bool get isRendered {
    return uiImageFuture != null && uiImageFuture.value != null;
  } // This is what tells it if the Future is completed or not

  @computed
  ui.Image get uiImage {
    return uiImageFuture.value;
  } // Returns completed image from future

  @computed
  Image get finalImage {
    Image src;
    if (baseImage == null) {
      return null;
    } else if (draftImage == null) {
      src = baseImage.clone();
    } else {
      src = draftImage.clone();
    }
    if (filter != null) {
      src = filter.apply(src);
    }
    return src;
  } // Applies the filter tothe image

  @action
  loadFile(File file) async {
    baseImage = decodeImage(await file.readAsBytes());
    final smallerSide = math.min(baseImage.width, baseImage.height).toDouble();
    size = ui.Size(baseImage.width.toDouble(), baseImage.height.toDouble());
    crop = ui.Rect.fromLTWH(0, 0, smallerSide, smallerSide);
  }

  @action
  cropTo(File croppedFile) async {
    if (croppedFile != null) {
      Image croppedImage = decodeImage(await croppedFile.readAsBytes());
      draftImage = croppedImage;
      size = ui.Size(baseImage.width.toDouble(), baseImage.height.toDouble());
    }
  }
}
