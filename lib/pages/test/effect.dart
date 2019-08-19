import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<TestState> buildEffect() {
  return combineEffects(<Object, Effect<TestState>>{
    Lifecycle.initState: _init,
    TestAction.onTestAction: _onTestAction,
  });
}

void _init(Action action, Context<TestState> ctx) {
  print('_init');
}

void _onTestAction(Action action, Context<TestState> ctx) {
  ctx.dispatch(TestActionCreator.testAction());
}
