import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:scale_core/core.dart';

extension BuildContextExtensions on BuildContext {
  T getStateManager<T>() => read<StateManagerRegistry>().getManager<T>();
}
