import 'package:mobx/mobx.dart';
import 'package:image/image.dart';

import 'filter.dart';
import 'decoration.dart';
import 'adjustment.dart';

part 'image_editor.g.dart';

class ImageEditor = _ImageEditor with _$ImageEditor;

abstract class _ImageEditor with Store {
  @observable
  Filter filter;

  @observable
  num filterAmount;

  @observable
  Image baseImage;

  @computed
  Image get finalImage {
    Image src = baseImage.clone();

    if (filter != null) {
      src = filter.apply(src, amount: filterAmount);
    }

    return src;
  }
}
