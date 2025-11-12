import 'package:provider/single_child_widget.dart';
import 'package:scale_core/core.dart';

abstract class PublicRegistry {
  void addGlobalStateManager<T extends StateManager>(T obj);
}

abstract class Registry implements PublicRegistry {
  List<SingleChildWidget> getProviders();

  T get<T>();
}
