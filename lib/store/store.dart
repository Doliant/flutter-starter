import 'package:redux/redux.dart';

import 'state.dart';
import 'reducers.dart';
import 'middlewares/http.dart';

Store<State> store = Store<State>(
  reducers,
  initialState: State(),
  middleware: [httpMiddleware],
);