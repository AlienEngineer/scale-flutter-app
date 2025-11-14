import 'package:feature_1/feature_1.dart';
import 'package:flutter/material.dart';
import 'package:scale_core/core.dart';

void main() {
  var registry = FeatureModulesRegistry(
    featureModules: [
      IncrementModule(),
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ModuleSetup(
        registry: registry,
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            OnCounterChangeWidget(
              builder: (_, count) {
                return Center(
                  child: Text(
                    '$count',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: IncrementCounterWidget(),
    );
  }
}
