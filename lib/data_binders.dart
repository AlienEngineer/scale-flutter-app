import 'package:feature_1/feature_1.dart' hide Capability;
import 'package:feature_2/feature_2.dart';
import 'package:scale_core/core.dart';

class VehicleToCapabilitiesBinder
    extends DataBinder<Vehicle, List<Capability>> {
  @override
  List<Capability> map(Vehicle data) =>
      data.capabilities.map((c) => Capability(name1: c.name)).toList();
}

class VehicleToBrandBinder extends DataBinder<Vehicle, Brand> {
  @override
  Brand map(Vehicle data) => Brand(name: data.brand);
}
