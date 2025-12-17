import 'package:feature_1/feature_1.dart';
import 'package:feature_2/feature_2.dart';
import 'package:flutter/material.dart';
import 'package:scale_framework/scale_framework.dart';

import 'app_cluster.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ModuleSetup(
        featureClusters: [
          AppCluster(),
        ],
        featureModules: [
          IncrementModule(),
          GarageModule(),
        ],
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Feature Garage:'),
          GarageWidget(),
          Text('Feature Brand:'),
          VehicleBrandWidget(),
          Text('Feature Capabilities:'),
          CapabilitiesWidget(),
          Text('Feature Increment:'),
          OnCounterChangeWidget(
            builder: (_, count) => Center(child: Text('$count')),
          ),
        ],
      ),
      floatingActionButton: IncrementCounterWidget(),
    );
  }
}
