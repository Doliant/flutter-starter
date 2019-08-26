import 'dart:io';

import 'package:dio/dio.dart';
import 'package:redux/redux.dart';

import 'middleware.dart' as appMiddleware;
import '../state.dart';
import '../actions/action.dart';
import '../actions/http.dart';

class AppDio extends Dio {
  AppDio() {
    // --- 默认配置 ---
    options.contentType = ContentType.json;
    options.responseType = ResponseType.json;
    // 基地址(server) TODO: config
    options.baseUrl = 'http://127.0.0.1:3021';
  }
}

class HttpMiddleware extends appMiddleware.Middleware<HttpAction> {
  // response code: 成功 TODO: config
  static const int responseSuccessCode = 0;
  // response code: 无用户权限 TODO: config
  static const int responseNoPermissionCode = 10011002;

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

  DioError _next(appMiddleware.MiddlewareNext<HttpAction> next, HttpAction action, HttpStatus status) {
    ActionCallback<HttpAction> callback;

    switch(status) {
      case HttpStatus.requesting:
        callback = action.onRequesting;
        break;
      case HttpStatus.success:
        callback = action.onSuccess;
        break;
      case HttpStatus.fail:
        callback = action.onFail;
        break;
    }

    if (!next(action, callback: callback)) {
      // 已被过滤
      return DioError(type: DioErrorType.CANCEL);
    }
  }

  @override
  void filterSingle(HttpAction action) {
    // TODO: implement filterSingle
  }

  @override
  void handle(Store<State> store, HttpAction action, appMiddleware.MiddlewareNext<HttpAction> next) async {
    AppDio dio = AppDio();
    Map<String, dynamic> data = _getData(action.data);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest:(RequestOptions options){
        // TODO: 执行拦截器

        // 开始请求
        return _next(next, action, HttpStatus.requesting);
      },
    ));

    try {
      // 请求
      Response<Map<String, dynamic>> response = await dio.request(
        action.url,
        options: Options(method: _getMethod(action.method)),
        data: action.method != HttpMethod.get ? data : null,
        queryParameters: action.method == HttpMethod.get ? data : null,
      );

      switch(response.data['code']) {
        // 成功
        case responseSuccessCode:

          break;
        // 无用户权限
        case responseNoPermissionCode:
          // TODO: action

          break;
        // 失败
        default:

      }
    } on DioError catch (e) {
      switch(e.type) {
        // 超时
        case DioErrorType.CONNECT_TIMEOUT:
          continue timeout;
        case DioErrorType.SEND_TIMEOUT:
          continue timeout;
        timeout:
        case DioErrorType.RECEIVE_TIMEOUT:
          // TODO: action
          break;
        // 关闭 (已被过滤?)
        case DioErrorType.CANCEL:
          // TODO: ...
          break;
        // 异常 TODO: 状态码
        case DioErrorType.RESPONSE:
          continue response;
        response:
        case DioErrorType.DEFAULT:

          break;
      }
    } catch (e) {
      // 前端异常 TODO: ...
      print(e);
    }


//    print(isFinished(action));

//    print(actions.length.toString());
//    print(_getData(action.data).toString());

//     action.status = HttpStatus.success;
//     bool isNext = next(action, callback: action.onSuccess);
//     print(isNext);
  }

}
