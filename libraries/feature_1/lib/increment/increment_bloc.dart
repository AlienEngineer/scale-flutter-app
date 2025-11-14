import 'package:scale_core/core.dart';

class IncrementStateManager extends StateManager<int> {
  IncrementStateManager() : super(0);

  increment() {
    pushNewState((oldState) => oldState + 1);
  }
}
