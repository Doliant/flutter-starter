import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class Test2Page extends Page<Test2State, Map<String, dynamic>> {
  Test2Page()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<Test2State>(
              adapter: null, slots: <String, Dependent<Test2State>>{}),
          middleware: <Middleware<Test2State>>[],
        );
}
