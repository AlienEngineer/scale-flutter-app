import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scale_core/core.dart';

abstract class StateManager<TState> {
  final BlocWrapper<TState> _bloc;

  StateManager(TState initialState) : _bloc = BlocWrapper<TState>(initialState);

  void pushNewState(TState Function(TState oldState) getNewState) =>
      _bloc.pushNewState(() => getNewState(_currentState));

  TState get _currentState => _bloc.state;

  BlocProvider<BlocWrapper<TState>> getProvider() =>
      BlocProvider(create: (BuildContext context) => _bloc);
}
