import '../../store/state.dart';
import '../../store/actions/action.dart';
import '../../store/reducer.dart';

import 'state.dart';
import 'action.dart';

class HomeReducer extends Reducer {
  @override
  bool handle(State appState, Action action) {
    print('reducer');
    HomeState state = appState.home;

    if (action is HomeActionTest) {
      HomeState data = action.data;
      state.testNum += data.testNum;
    }
    else {
      return false;
    }

    return true;
  }

}

