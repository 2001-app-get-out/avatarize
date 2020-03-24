import 'package:mobx/mobx.dart';
import 'package:image/image.dart';

import 'filter.dart';
import 'decoration.dart';
import 'adjustment.dart';

part 'editor_store.g.dart';

class EditorStore = _EditorStore with _$EditorStore;

abstract class _EditorStore with Store {
  @observable
  Filter filter;

  @observable
  num filterAmount;

  final ObservableList<Adjustment> adjustments = ObservableList.of([]);

  final ObservableList<Decoration> decorations = ObservableList.of([]);

  @observable
  Image baseImage;

  @computed
  Image get finalImage {
    Image src = baseImage.clone();

    if (filter != null) {
      src = filter.apply(src, amount: filterAmount);
    }
  }
}
