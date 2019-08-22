import 'package:redux/redux.dart';
import 'reducers.dart';
import 'state.dart';

Store<State> store = Store<State>(reduers, initialState: State());