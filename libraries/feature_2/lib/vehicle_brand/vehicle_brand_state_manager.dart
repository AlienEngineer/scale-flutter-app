import 'package:scale_core/core.dart';

import 'brand.dart';

class VehicleBrandStateManager extends StateManager<Brand> {
  VehicleBrandStateManager(DataConsumer<Brand> onBrandChange)
      : super(Brand.empty()) {
    onBrandChange.listen((brand) => pushNewState((_) => brand));
  }
}
