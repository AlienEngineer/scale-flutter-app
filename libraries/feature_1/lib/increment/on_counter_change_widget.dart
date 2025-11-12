import 'package:flutter/widgets.dart';
import 'package:scale_core/core.dart';

import 'increment_bloc.dart';

class OnCounterChangeWidget extends StatelessWidget {
  final Widget Function(BuildContext, int) builder;

  const OnCounterChangeWidget({super.key, required this.builder});

  @override
  Widget build(BuildContext context) =>
      StateBuilder<IncrementStateManager, int>(builder: builder);
}
