import 'package:mobx/mobx.dart';
import 'package:image/image.dart';

part 'filter.g.dart';

abstract class Filter<T> = _Filter<T> with _$Filter<T>;

abstract class _Filter<T> with Store {
  @observable
  T settings;

  Image apply(Image src);
}

class Sepia extends Filter<num> {
  Image apply(Image src) {
    return sepia(src, amount: settings);
  }
}

// TODO: more filters
