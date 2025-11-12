import 'package:feature_1/vehicle_garage/garage_loader.dart';
import 'package:feature_1/vehicle_garage/vehicle_selector/vehicle_selected.dart';
import 'package:feature_1/vehicle_garage/vehicle_selector/vehicle_selected_notifier.dart';
import 'package:scale_core/core.dart';

class GarageModule extends FeatureModule {
  final VehicleSelectedNotifier vehicleSelectedNotifier;
  GarageModule(this.vehicleSelectedNotifier);

  @override
  void setup(PublicRegistry registry) {
    registry.addGlobalStateManager(GarageLoader());
    registry.addGlobalStateManager(VehicleSelected(vehicleSelectedNotifier));
  }
}
