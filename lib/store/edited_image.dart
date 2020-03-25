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
  final SquareCrop crop = SquareCrop();

  @observable
  Filter filter = Grayscale();

  @observable
  Image baseImage;

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
  }

  @computed
  ui.Image get uiImage {
    return uiImageFuture.value;
  }

  @computed
  Image get finalImage {
    if (baseImage == null) {
      return null;
    }

    Image src = baseImage.clone();
    if (filter != null) {
      src = filter.apply(src);
    }
    return src;
  }

  @action
  loadFile(File file) async {
    baseImage = decodeImage(await file.readAsBytes());
    int size = math.min(baseImage.width, baseImage.height);
    crop.setBounds(
      xMax: baseImage.width.toDouble(),
      yMax: baseImage.height.toDouble(),
      sizeMax: size.toDouble(),
    );
    crop.moveAndScale(
      xOffset: 0,
      yOffset: 0,
      size: size.toDouble(),
    );
  }
}

class SquareCrop = _SquareCrop with _$SquareCrop;

abstract class _SquareCrop with Store {
  @observable
  double xOffset = 0;

  @observable
  double yOffset = 0;

  @observable
  double size;

  @observable
  double sizeMax;

  @observable
  double sizeMin = 32;

  @observable
  double xMax;

  @observable
  double yMax;

  @computed
  ui.Rect get rect {
    return ui.Rect.fromLTWH(xOffset, yOffset, size, size);
  }

  @action
  void setBounds(
      {double xMax, double yMax, double sizeMax, double sizeMin = 32}) {
    this.xMax = xMax;
    this.yMax = yMax;
    this.sizeMax = sizeMax;
    this.sizeMin = sizeMin;
  }

  @action
  void moveAndScale({double xOffset = 0.0, double yOffset = 0.0, double size}) {
    size = math.max(sizeMin, math.min(size, sizeMax));
    this.size = size;
    this.xOffset = math.max(0, math.min(xOffset, xMax - size));
    this.yOffset = math.max(0, math.min(yOffset, yMax - size));
  }
}
