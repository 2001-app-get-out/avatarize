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
  Image baseImage;

  @observable
  ui.Size size;

  @computed
  double get smallerSide => math.min(size.width, size.height);

  @observable
  ui.Rect crop;

  @observable
  Filter filter = Grayscale();

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
    final smallerSide = math.min(baseImage.width, baseImage.height).toDouble();
    size = ui.Size(baseImage.width.toDouble(), baseImage.height.toDouble());
    crop = ui.Rect.fromLTWH(0, 0, smallerSide, smallerSide);
  }

  @action
  cropTo(ui.Rect rect) {
    final overflow = 0.0;
    final minSize = 32.0;
    this.crop = ui.Rect.fromLTRB(
      math.max(-overflow, math.min(rect.left, size.width - minSize + overflow)),
      math.max(-overflow, math.min(rect.top, size.height - minSize + overflow)),
      math.max(-overflow, math.min(rect.right, size.height + overflow)),
      math.max(-overflow, math.min(rect.bottom, size.height + overflow)),
    );
  }
}
