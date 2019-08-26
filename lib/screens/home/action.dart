import '../../store/actions/action.dart';
import '../../store/actions/http.dart';

import 'state.dart';

class HomeActionTest extends Action {
  HomeActionTest(int num) {
    data = HomeState()..testNum = num;
  }
}

class HomeActionTestHttp extends HttpAction {
  HomeActionTestHttp(int num) {
    data = num;
    url = '/user/get_user_info';
    method = HttpMethod.GET;
  }
}