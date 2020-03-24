import 'package:image/image.dart';

abstract class Filter {
  Image apply(Image src, {num amount = 1.0});
}

class Sepia extends Filter {
  Image apply(Image src, {num amount = 1.0}) {
    return sepia(src, amount: amount);
  }
}

// TODO: more filters
