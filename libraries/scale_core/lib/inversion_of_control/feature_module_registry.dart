import 'package:provider/single_child_widget.dart';
import 'package:scale_core/core.dart';

class FeatureModulesRegistry implements Registry, ModuleRegistry {
  final Map<Type, LazyRecord<Object>> _lazySingletons = {};
  final Map<Type, Object> _resolvedServices = {};
  final List<SingleChildWidget> _providers = [];

  @override
  List<SingleChildWidget> getProviders() => _providers;

  @override
  void addGlobalStateManager<T extends StateManager>(T obj) {
    _providers.add(obj.getProvider());
    _resolvedServices[T] = obj;
  }

  @override
  T get<T>() {
    if (_resolvedServices.containsKey(T)) {
      return _resolvedServices[T] as T;
    }

    _resolvedServices[T] = _lazySingletons[T]?.call(this) as Object;

    return get<T>();
  }

  @override
  void addSingletonLazy<T>(T Function(ServiceCollection service) callback) {
    _lazySingletons[T] = (service) => callback(service) as Object;
  }

  @override
  void addModule(LazyRecord<FeatureModule> moduleBuilder) =>
      moduleBuilder(this).setup(this);

  @override
  void addDataBinder<T1, T2>(DataBinder<T1, T2> Function() binder) {
    addSingletonLazy<DataProducer<T1>>(
      (_) => binder(),
    );
    addSingletonLazy<DataConsumer<T2>>(
      (service) => service.get<DataProducer<T1>>() as DataBinder<T1, T2>,
    );
  }
}

abstract class FeatureModule {
  void setup(PublicRegistry registry);
}

abstract class FeatureCluster {
  void setup(ModuleRegistry registry);
}
