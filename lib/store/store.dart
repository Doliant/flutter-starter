import 'package:redux/redux.dart';

import 'state.dart';
import 'middlewares/http.dart';

import '../screens/home/reducer.dart';

Store<State> store = Store<State>(
  combineReducers([
    HomeReducer().reducer,


  ]),
  initialState: State(),
  middleware: [HttpMiddleware().httpMiddleware],
);