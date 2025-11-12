import 'package:scale_core/core.dart';

import 'increment_bloc.dart';

class IncrementModule extends FeatureModule {
  @override
  void setup(PublicRegistry registry) {
    registry.addGlobalStateManager(IncrementStateManager());
  }
}
