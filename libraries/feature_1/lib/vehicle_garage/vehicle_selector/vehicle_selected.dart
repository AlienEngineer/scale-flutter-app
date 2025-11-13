import 'package:feature_1/feature_1.dart';
import 'package:scale_core/core.dart';

class VehicleSelectionStateManager extends StateManager<Vehicle> {
  final DataProducer<Vehicle> producer;
  VehicleSelectionStateManager(this.producer)
      : super(Vehicle(vin: 'none', brand: 'none'));

  void select(Vehicle vehicle) {
    pushNewState((_) => vehicle);
    producer.push(vehicle);
  }
}
