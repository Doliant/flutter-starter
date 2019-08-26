import 'dart:io';

import 'package:dio/dio.dart';
import 'package:redux/redux.dart';

import 'middleware.dart' as appMiddleware;
import '../state.dart';
import '../actions/http.dart';

class AppDio extends Dio {
  AppDio() {
    // --- 默认配置 ---
    options.contentType = ContentType.json;
    options.responseType = ResponseType.json;
    // 基地址(server) todo
    options.baseUrl = 'http://127.0.0.1:3021';
  }
}

class HttpMiddleware extends appMiddleware.Middleware<HttpAction> {

  String _getMethod(HttpMethod method) {
    switch(method) {
      case HttpMethod.get:
        return 'GET';
      case HttpMethod.post:
        return 'POST';
      case HttpMethod.put:
        return 'PUT';
      case HttpMethod.delete:
        return 'DELETE';
    }
  }

  Map<String, dynamic> _getData(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data;
    }
    else if (data != null) {
      return {'data': data};
    }
    return null;
  }

//  @override
//  void filterSingle(HttpAction action) {
//    // TODO: implement filterSingle
//
//
//  }

  @override
  void handle(Store<State> store, HttpAction action, appMiddleware.MiddlewareNext<HttpAction> next) async {
    AppDio dio = AppDio();
    Map<String, dynamic> data = _getData(action.data);

    try {

    } on DioError catch (e) {

    }
    Response<Map<String, dynamic>> response = await dio.request(
      action.url,
      options: Options(method: _getMethod(action.method)),
      data: action.method != HttpMethod.get ? data : null,
      queryParameters: action.method == HttpMethod.get ? data : null,
    );


//    print(isFinished(action));

//    print(actions.length.toString());
//    print(_getData(action.data).toString());

     action.status = HttpStatus.success;
     bool isNext = next(action, callback: action.onSuccess);
     print(isNext);
  }

}
