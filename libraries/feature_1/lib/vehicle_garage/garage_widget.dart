import 'package:feature_1/vehicle_garage/garage_loader.dart';
import 'package:feature_1/vehicle_garage/vehicle_selector/vehicle_selection_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:scale_core/core.dart';

class GarageWidget extends StatelessWidget {
  const GarageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StateBuilder<GarageLoader, List<Vehicle>>(
      builder: (context, state) => Column(
        children: state
            .map((vehicle) => VehicleSelectionWidget(
                  onTap: (select) => select(vehicle),
                  child: Text(vehicle.vin),
                ))
            .toList(),
      ),
    );
  }
}
