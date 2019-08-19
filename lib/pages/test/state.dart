import 'package:fish_redux/fish_redux.dart';

class TestState implements Cloneable<TestState> {
  int testNum = 0;

  @override
  TestState clone() {
    return TestState();
  }
}

TestState initState(Map<String, dynamic> args) {
  print(13);
  return TestState();
}
