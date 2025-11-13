import 'package:feature_1/vehicle_garage/garage_loader.dart';
import 'package:feature_1/vehicle_garage/vehicle_selector/vehicle_selected.dart';
import 'package:flutter/material.dart';
import 'package:scale_core/core.dart';

class VehicleSelectionWidget extends StatelessWidget {
  final void Function(void Function(Vehicle vehicle) select) onTap;
  final Widget child;
  const VehicleSelectionWidget({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: child,
      onTap: () => onTap(
        context.getStateManager<VehicleSelectionStateManager>().select,
      ),
    );
  }
}
