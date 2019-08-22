import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TestPage extends Page<TestState, Map<String, dynamic>> {
  TestPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<TestState>(
              adapter: null, slots: <String, Dependent<TestState>>{}),
          middleware: <Middleware<TestState>>[
            httpMiddleware(),
            logMiddleware(tag: 'testPage'),
          ],
        );
}

Middleware<T> httpMiddleware<T>() => ({Dispatch dispatch, Get<T> getState}) => (Dispatch next) => (Action action) {
  final TestState state = getState() as TestState;
  print('27 ${action.type} ${state.testNum}');
  next(action);
};

Middleware<T> logMiddleware<T>({
  String tag = 'redux',
  String Function(T) monitor,
}) {
  return ({Dispatch dispatch, Get<T> getState}) {
    return (Dispatch next) {
      return isDebug()
          ? (Action action) {
        print('---------- [$tag] ----------');
        print('[$tag] ${action.type} ${action.payload}');

        final T prevState = getState();
        if (monitor != null) {
          print('[$tag] prev-state: ${monitor(prevState)}');
        }

        next(action);

        final T nextState = getState();
        if (monitor != null) {
          print('[$tag] next-state: ${monitor(nextState)}');
        }

        // if (prevState == nextState) {
        //   print('[$tag] warning: ${action.type} has not been used.');
        // }

        print('========== [$tag] ================');
      }
          : next;
    };
  };
}
