import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<Test2State> buildEffect() {
  return combineEffects(<Object, Effect<Test2State>>{
    Test2Action.action: _onAction,
  });
}

void _onAction(Action action, Context<Test2State> ctx) {
}
