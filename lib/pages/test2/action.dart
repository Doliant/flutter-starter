import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum Test2Action { action }

class Test2ActionCreator {
  static Action onAction() {
    return const Action(Test2Action.action);
  }
}
