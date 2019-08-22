import '../screens/home/state.dart';

class State {
  HomeState home = HomeState();

  State clone() {
    return State()
      ..home = home


    ;
  }
}