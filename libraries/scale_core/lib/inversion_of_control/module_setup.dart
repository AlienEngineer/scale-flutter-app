import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:scale_core/core.dart';

class ModuleSetup extends StatelessWidget {
  final List<FeatureModule>? featureModules;
  final List<FeatureCluster>? featureClusters;
  final Widget child;
  const ModuleSetup({
    super.key,
    this.featureModules,
    this.featureClusters,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final registry = _setupRegistry();
    return Provider<StateManagerRegistry>(
      create: (context) => StateManagerRegistry(registry),
      child: MultiBlocProvider(
        providers: registry.getProviders(),
        child: child,
      ),
    );
  }

  FeatureModulesRegistry _setupRegistry() {
    final registry = FeatureModulesRegistry();

    if (featureModules != null) {
      for (var value in featureModules!) {
        value.setup(registry);
      }
    }

    if (featureClusters != null) {
      for (var cluster in featureClusters!) {
        cluster.setup(registry);
      }
    }

    return registry;
  }
}

class StateManagerRegistry {
  final Registry registry;
  const StateManagerRegistry(this.registry);

  T getManager<T>() => registry.get<T>();
}
