import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scale_core/core.dart';

class BlocWrapper<TState> extends Cubit<TState> {
  BlocWrapper(super.initialState);

  void pushNewState(TState Function() getNewState) => emit(getNewState());
}

class StateBuilder<T extends StateManager<S>, S> extends StatelessWidget {
  final Widget Function(BuildContext context, S state) builder;

  const StateBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<BlocWrapper<S>, S>(builder: builder);
}
