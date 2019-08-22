import 'state.dart';
import 'action.dart';

abstract class Reducer {
  State reducer(State appState, dynamic action) {
    State newAppState = appState.clone();
    if (handle(newAppState, action)) {
      return newAppState;
    }
    return appState;
  }

  bool handle(State appState, Action action);
}