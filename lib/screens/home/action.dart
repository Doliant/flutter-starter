import '../../store/action.dart';

import 'state.dart';

class HomeActionTest extends Action {
  HomeActionTest(int num) {
    data = HomeState()..testNum = num;
  }
}

class HomeActionTestHttp extends HttpAction {
  HomeActionTestHttp(int num) {
    data = num;
    url = 'http://127.0.0.1:3021/user/get_user_info';
    method = HttpMethod.GET;
  }
}