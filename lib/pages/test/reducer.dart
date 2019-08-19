import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TestState> buildReducer() {
  return asReducer(
    <Object, Reducer<TestState>>{
      TestAction.testAction: _onTestAction,
    },
  );
}

TestState _onTestAction(TestState state, Action action) {
  final TestState newState = state.clone();
  newState.testNum = ++state.testNum;
  print(newState.testNum);
  return newState;
}
