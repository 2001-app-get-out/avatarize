import 'dart:async';
import 'dart:io';
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
  Filter filter = Sepia();

  @observable
  num filterAmount = 1.0;

  @observable
  Image baseImage;

  @observable
  ObservableFuture<ui.Image> uiImageFuture;

  ui.Image uiImage;

  @action
  loadFile(File file) async {
    baseImage = decodeImage(await file.readAsBytes());
    int size = math.min(baseImage.width, baseImage.height);
    crop.moveAndScale(xOffset: 0, yOffset: 0, size: size.toDouble());
    uiImageFuture = ObservableFuture(_renderImage());
    uiImage = await uiImageFuture;
  }

  @computed
  bool get isRendered {
    return uiImageFuture != null &&
        uiImageFuture.status == FutureStatus.fulfilled;
  }

  @computed
  Image get finalImage {
    Image src = baseImage.clone();

    if (filter != null) {
      src = filter.apply(src, amount: filterAmount);
    }

    return src;
  }

  Future<ui.Image> _renderImage() {
    var completer = Completer<ui.Image>();

    ui.decodeImageFromPixels(
      finalImage.getBytes(),
      finalImage.width,
      finalImage.height,
      ui.PixelFormat.rgba8888,
      completer.complete,
    );

    return completer.future;
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

  @computed
  ui.Rect get rect {
    return ui.Rect.fromLTWH(xOffset, yOffset, size, size);
  }

  @action
  void moveAndScale({double xOffset, double yOffset, double size}) {
    this.xOffset = xOffset;
    this.yOffset = yOffset;
    this.size = size;
  }
}
