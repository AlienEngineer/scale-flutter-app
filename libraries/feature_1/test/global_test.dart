import 'package:feature_1/feature_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scale_core/core.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

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

void main() {
  testWidgets('On render display initial state which is 0',
      (WidgetTester tester) async {
    await pumpApp(tester);

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
  });
  testWidgets('After tapping floating button increments state to 1',
      (WidgetTester tester) async {
    await pumpApp(tester);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter starts at 0.
    expect(find.text('1'), findsOneWidget);
  });
  testWidgets('After tapping twice floating button increments state to 2',
      (WidgetTester tester) async {
    await pumpApp(tester);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter starts at 0.
    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('rendering displays the list of vehicles', (tester) async {
    await pumpApp(tester);

    expect(find.byType(Text), findsNWidgets(5));
  });
}

Future<void> pumpApp(WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(
    home: ModuleSetup(
      registry: FeatureModulesRegistry(
        featureModules: [
          IncrementModule(),
          GarageModule(),
        ],
      ),
      child: TestWidget(),
    ),
  ));
  await tester.pump(Duration(seconds: 10));
}
