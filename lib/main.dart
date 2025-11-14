import 'package:feature_1/feature_1.dart';
import 'package:feature_2/feature_2.dart';
import 'package:flutter/material.dart';
import 'package:scale_core/core.dart';
import 'package:scale_flutter_app/app_cluster.dart';

void main() {
  var registry = FeatureModulesRegistry(
    featureModules: [
      IncrementModule(),
      GarageModule(),
    ],
  );
  runApp(MyApp(registry));
}

class MyApp extends StatelessWidget {
  final FeatureModulesRegistry registry;
  const MyApp(this.registry, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ModuleSetup(
        registry: registry,
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
          GarageWidget(),
          OnCounterChangeWidget(
            builder: (_, count) => Center(child: Text('$count')),
          ),
        ],
      ),
      floatingActionButton: IncrementCounterWidget(),
    );
  }
}
