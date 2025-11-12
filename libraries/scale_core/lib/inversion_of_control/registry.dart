import 'package:provider/single_child_widget.dart';
import 'package:scale_core/core.dart';

abstract class ModuleRegistry {
  void addModule(LazyRecord<FeatureModule> moduleBuilder);
}

typedef LazyRecord<T> = T Function(ServiceCollection service);

abstract class PublicRegistry {
  void addGlobalStateManager<T extends StateManager>(T obj);
  void addSingletonLazy<T>(LazyRecord<T> callback);
}

abstract class ServiceCollection {
  T get<T>();
}

abstract class Registry implements PublicRegistry, ServiceCollection {
  List<SingleChildWidget> getProviders();
}
