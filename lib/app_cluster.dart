import 'package:feature_1/feature_1.dart' hide Capability;
import 'package:feature_2/feature_2.dart';
import 'package:scale_core/core.dart';
import 'package:scale_flutter_app/data_binders.dart';

class AppCluster implements FeatureCluster {
  @override
  void setup(ModuleRegistry registry) {
    registry.addModule((_) => AppModule());
    registry.addModule((_) => IncrementModule());
    registry.addModule(
      (service) => GarageModule(
        vehicleSelectedNotifier: service.get<DataProducer<Vehicle>>(),
      ),
    );
    registry.addModule(
      (service) => CapabilitiesModule(
        service.get<DataConsumer<List<Capability>>>(),
      ),
    );
    registry.addModule(
      (service) => VehicleBrandModule(
        onBrandChange: service.get<DataConsumer<Brand>>(),
      ),
    );
  }
}

class AppModule implements FeatureModule {
  @override
  void setup(PublicRegistry registry) {
    registry.addDataBinder<Vehicle, List<Capability>>(
      () => VehicleToCapabilitiesBinder(),
    );
    registry.addDataBinder<Vehicle, Brand>(
      () => VehicleToBrandBinder(),
    );
  }
}
