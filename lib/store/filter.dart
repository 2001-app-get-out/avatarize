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


class Fill extends Filter {
  final int color = 700;
  const Fill();
  Image apply(Image src) {
    return fill(src, color);
  }
}

class Pixelate extends Filter {
  final int blockSize = 10;
  final PixelateMode mode;

  const Pixelate({this.mode = PixelateMode.upperLeft});

  Image apply(Image src) {
    return pixelate(src, blockSize, mode: mode);
  }
}

// TODO: more filters
