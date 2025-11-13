import 'package:feature_2/feature_2.dart';
import 'package:scale_core/core.dart';

class CapabilitiesModule extends FeatureModule {
  final DataConsumer<List<Capability>> onChange;

  CapabilitiesModule(this.onChange);

  @override
  void setup(PublicRegistry registry) {
    registry.addGlobalStateManager(CapabilitiesStateManager(onChange));
  }
}
