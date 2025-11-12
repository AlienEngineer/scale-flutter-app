import 'package:feature_1/feature_1.dart';
import 'package:scale_core/core.dart';
import 'package:scale_flutter_app/vehicle_selection.dart';

class AppCluster implements FeatureCluster {
  @override
  void setup(ModuleRegistry registry) {
    registry.addModule((_) => AppModule());
    registry.addModule((_) => IncrementModule());
    registry.addModule(
      (service) => GarageModule(service.get<VehicleSelectedNotifier>()),
    );
  }
}

class AppModule implements FeatureModule {
  @override
  void setup(PublicRegistry registry) {
    registry
        .addSingletonLazy<VehicleSelectedNotifier>((_) => VehicleSelection());
  }
}
