import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

import '../test/action.dart';

Reducer<Test2State> buildReducer() {
  return asReducer(
    <Object, Reducer<Test2State>>{
      Test2Action.action: _onAction,
      TestAction.testAction: _onTestAction,
    },
  );
}

Test2State _onAction(Test2State state, Action action) {
  final Test2State newState = state.clone();
  return newState;
}

Test2State _onTestAction(Test2State state, Action action) {
  final Test2State newState = state.clone();
  print('24 ${action.type}');
  return newState;
}
