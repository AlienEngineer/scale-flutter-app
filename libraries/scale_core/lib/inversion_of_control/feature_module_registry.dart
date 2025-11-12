import 'package:provider/single_child_widget.dart';
import 'package:scale_core/core.dart';

class FeatureModulesRegistry implements Registry {
  final List<SingleChildWidget> _providers = [];
  final Map<Type, Object> _stateManagers = {};

  @override
  List<SingleChildWidget> getProviders() => _providers;

  @override
  void addGlobalStateManager<T extends StateManager>(T obj) {
    _providers.add(obj.getProvider());
    _stateManagers[T] = obj;
  }

  @override
  T get<T>() => _stateManagers[T] as T;
}

abstract class FeatureModule {
  void setup(PublicRegistry registry);
}
