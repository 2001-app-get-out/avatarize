import 'package:image/image.dart';

abstract class Filter {
  const Filter();

  Image apply(Image src);
}

class Sepia extends Filter {
  final num amount;

  const Sepia({this.amount = 1.0});

  Image apply(Image src) {
    return sepia(src, amount: amount);
  }
}

class Grayscale extends Filter {
  const Grayscale();
  Image apply(Image src) {
    return grayscale(src);
  }
}

class Pixelate extends Filter {
  final int blockSize;
  final PixelateMode mode;

  const Pixelate({this.blockSize, this.mode = PixelateMode.upperLeft});

  Image apply(Image src) {
    return pixelate(src, blockSize, mode: mode);
  }
}

// TODO: more filters
