import 'package:feature_1/feature_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scale_core/core.dart';

main() {
  testWidgets('rendering displays the list of vehicles', (tester) async {
    await pumpApp(tester);
    await tester.pump(Duration(seconds: 10));

    expect(find.byType(Text), findsNWidgets(4));
  });
}

Future<void> pumpApp(WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(
    home: ModuleSetup(
      featureModules: [GarageModule()],
      child: Scaffold(body: GarageWidget()),
    ),
  ));
}
