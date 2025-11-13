import 'package:scale_core/core.dart';

class GarageLoader extends StateManager<List<Vehicle>> {
  GarageLoader() : super([]) {
    load();
  }

  void load() {
    Future.delayed(Duration(seconds: 0)).then(
      (_) => pushNewState((_) => [
            Vehicle(vin: 'V9', brand: 'some brand'),
            Vehicle(vin: 'V8', brand: 'some brand'),
            Vehicle(vin: 'V7', brand: 'some brand'),
            Vehicle(vin: 'V6', brand: 'some brand')
          ]),
    );
    Future.delayed(Duration(seconds: 5)).then(
      (_) => pushNewState((_) => [
            Vehicle(vin: 'VX59', brand: 'some brand'),
            Vehicle(vin: 'VX58', brand: 'some brand'),
            Vehicle(vin: 'VX57', brand: 'some brand'),
            Vehicle(vin: 'VX56', brand: 'some brand')
          ]),
    );
  }
}

class Vehicle {
  final String vin;
  final String brand;
  final List<Capability> capabilities;
  // All the vehicle info

  Vehicle({
    required this.vin,
    required this.brand,
    this.capabilities = const [],
  });
}

class Capability {
  final String name;
  Capability({required this.name});
}
