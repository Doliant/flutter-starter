import 'state.dart';
import '../../store/state.dart';
import '../../store/action.dart';

State homeReducer(State appState, dynamic action) {
  State newAppState = appState.clone();
  HomeState state = newAppState.home;
  bool isChange = true;

  switch(action) {
    case 'testAction':
      state.testNum++;
      break;
    default:
      isChange = false;
      break;
  }

  if (isChange) return newAppState;
  return appState;
}

