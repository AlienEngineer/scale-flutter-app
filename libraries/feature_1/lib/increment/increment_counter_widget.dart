import 'package:flutter/material.dart';
import 'package:scale_core/core.dart';

import 'increment_bloc.dart';

class IncrementCounterWidget extends StatelessWidget {
  const IncrementCounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () =>
          context.getStateManager<IncrementStateManager>().increment(),
      tooltip: 'Increment',
      child: Icon(Icons.add), //const Icon(Icons.add),
    );
  }
}
