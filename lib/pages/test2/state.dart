import 'package:fish_redux/fish_redux.dart';

class Test2State implements Cloneable<Test2State> {

  @override
  Test2State clone() {
    return Test2State();
  }
}

Test2State initState(Map<String, dynamic> args) {
  print(12);
  return Test2State();
}
