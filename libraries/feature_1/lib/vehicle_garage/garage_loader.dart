import 'package:scale_core/core.dart';

class GarageLoader extends StateManager<List<Vehicle>> {
  GarageLoader() : super([]);

  void load() {
    Future.delayed(Duration(seconds: 2)).then(
      (_) => pushNewState((_) => [
            Vehicle(vin: '1', brand: 'some brand'),
            Vehicle(vin: '2', brand: 'some brand'),
            Vehicle(vin: '3', brand: 'some brand'),
            Vehicle(vin: '4', brand: 'some brand')
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
