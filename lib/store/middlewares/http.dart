import 'package:redux/redux.dart';

import '../state.dart';
import '../action.dart';

void httpMiddleware(Store<State> store, dynamic action, NextDispatcher next) {
  if (!(action is HttpAction)) return next(action);

  HttpAction httpAction = action;
  print(httpAction.url);

  next(action);
}