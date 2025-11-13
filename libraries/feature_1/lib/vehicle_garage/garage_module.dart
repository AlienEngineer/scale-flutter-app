import 'package:feature_1/vehicle_garage/garage_loader.dart';
import 'package:feature_1/vehicle_garage/vehicle_selector/vehicle_selected.dart';
import 'package:scale_core/core.dart';

class GarageModule extends FeatureModule {
  final DataProducer<Vehicle> vehicleSelectedNotifier;
  GarageModule({
    this.vehicleSelectedNotifier = const SubVehicleSelectedNotifier(),
  });

  @override
  void setup(PublicRegistry registry) {
    registry.addGlobalStateManager(GarageLoader());
    registry.addGlobalStateManager(
      VehicleSelectionStateManager(vehicleSelectedNotifier),
    );
  }
}

class SubVehicleSelectedNotifier implements DataProducer<Vehicle> {
  const SubVehicleSelectedNotifier();
  @override
  void push(Vehicle vehicle) {}
}
