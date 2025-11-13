import 'package:feature_2/vehicle_brand/vehicle_brand_state_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:scale_core/core.dart';

import 'brand.dart';

class VehicleBrandWidget extends StatelessWidget {
  const VehicleBrandWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StateBuilder<VehicleBrandStateManager, Brand>(
        builder: (context, brand) {
      return Text(brand.name);
    });
  }
}
