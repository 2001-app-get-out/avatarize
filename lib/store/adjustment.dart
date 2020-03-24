import 'package:mobx/mobx.dart';
import 'package:image/image.dart';

part 'adjustment.g.dart';

abstract class Adjustment<T> = _Adjustment<T> with _$Adjustment<T>;

abstract class _Adjustment<T> with Store {
  @observable
  T settings;

  Image apply(Image src);
}

class Tilt extends Adjustment<num> {
  Image apply(Image src) {
    // TODO: implement tilt
    return src;
  }
}
