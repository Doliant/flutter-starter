import 'package:fish_redux/fish_redux.dart';

enum TestAction { testAction, onTestAction }

class TestActionCreator {
  static Action testAction() {
    return const Action(TestAction.testAction, payload: 'payload');
  }

  static Action onTestAction() {
    return const Action(TestAction.onTestAction);
  }
}
