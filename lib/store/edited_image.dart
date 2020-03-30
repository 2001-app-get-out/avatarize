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
  File ogImage;

  @observable
  Image baseImage;

  @observable
  ui.Size size;

  @observable
  ui.Rect crop;

  @observable
  Filter filter;

  @computed
  double get smallerSide => math.min(size.width, size.height);

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
    if (baseImage == null) {
      return null;
    }

    Image src = baseImage.clone();
    if (filter != null) {
      src = filter.apply(src);
    }
    return src;
  } // Applies the filter tothe image

  @action
  loadFile(File file) async {
<<<<<<< Updated upstream
    ogImage = file;
=======

>>>>>>> Stashed changes
    baseImage = decodeImage(await file.readAsBytes());
    final smallerSide = math.min(baseImage.width, baseImage.height).toDouble();
    size = ui.Size(baseImage.width.toDouble(), baseImage.height.toDouble());
    crop = ui.Rect.fromLTWH(0, 0, smallerSide, smallerSide);
  }

  @action
  cropTo(ui.Rect rect) {
    final overflow = 0.0;
    final minSize = smallerSide / 16;
    final left = math.max(
        -overflow, math.min(rect.left, size.width - minSize + overflow));
    final top = math.max(
        -overflow, math.min(rect.top, size.height - minSize + overflow));
    this.crop = ui.Rect.fromLTRB(
      left,
      top,
      math.max(left + minSize, math.min(rect.right, size.height + overflow)),
      math.max(top + minSize, math.min(rect.bottom, size.height + overflow)),
    );
  }
}
