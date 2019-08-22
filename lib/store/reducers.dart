import 'package:redux/redux.dart';

import '../screens/home/reducer.dart';

final reducers = combineReducers([
  HomeReducer().reducer,
]);