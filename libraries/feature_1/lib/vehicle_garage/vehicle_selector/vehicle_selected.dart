import 'package:feature_1/feature_1.dart';
import 'package:scale_core/core.dart';

class VehicleSelected extends StateManager<Vehicle> {
  final VehicleSelectedNotifier notifier;
  VehicleSelected(this.notifier) : super(Vehicle(vin: 'none', brand: 'none'));

  void selectVehicle(Vehicle vehicle) {
    pushNewState((_) => vehicle);
    notifier.onVehicleSelected(vehicle);
  }
}
