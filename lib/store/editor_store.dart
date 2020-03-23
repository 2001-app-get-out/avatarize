import 'package:mobx/mobx.dart';
import 'package:image/image.dart';

import 'filter.dart';
import 'decoration.dart';

part 'editor_store.g.dart';

class EditorStore = _EditorStore with _$EditorStore;

abstract class _EditorStore with Store {
  final ObservableMap<String, Filter> filters = ObservableMap.of({});

  final ObservableList<Decoration> decorations = ObservableList.of([]);

  @observable
  Image baseImage;

  @observable
  Image finalImage;
}
