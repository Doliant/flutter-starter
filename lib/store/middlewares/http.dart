import 'dart:io';

import 'package:dio/dio.dart';
import 'package:redux/redux.dart';

import 'middleware.dart' as appMiddleware;
import '../state.dart';
import '../actions/action.dart';
import '../actions/http.dart';

class AppDio {
  // 单例
  static Dio dio;
  static Dio getDio() {
    if (dio == null) {
      dio = new Dio();

      // 拦截器
      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          // 持锁
          if (options.headers['isLock']) dio.lock();
        },
      ));

      // --- 默认配置 ---
      dio.options.contentType = ContentType.json;
      dio.options.responseType = ResponseType.json;
      // 基地址(server) TODO: config
      dio.options.baseUrl = 'http://127.0.0.1:3021';
    }
    return dio;
  }
}

class HttpMiddleware extends appMiddleware.Middleware<HttpAction> {
  // response code: 成功 TODO: config
  static const int responseSuccessCode = 0;
  // response code: 无用户权限 TODO: config
  static const int responseNoPermissionCode = 10011002;

  /// 获取method
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

  /// 获取请求data
  Map<String, dynamic> _getData(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data;
    }
    else if (data != null) {
      return {'data': data};
    }
    return null;
  }

  /// next
  void _next(appMiddleware.MiddlewareNext<HttpAction> next, HttpAction action, HttpStatus status) {
    ActionCallback<HttpAction> callback;

    // 解锁
    if (status != HttpStatus.requesting && action.isLock) {
      AppDio.getDio().unlock();
    }

    // 回调
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

    // 当前状态
    action.status = status;

    // next
    if (!next(action, callback: callback)) {
      // 已被过滤
      throw DioError(type: DioErrorType.CANCEL);
    }

    // 完成
    if (status != HttpStatus.requesting) {
      finish(action);
    }
  }

  @override
  void filterSingle(HttpAction action) {
    // TODO: implement filterSingle
  }

  @override
  void handle(Store<State> store, HttpAction action, appMiddleware.MiddlewareNext<HttpAction> next) async {
    Dio dio = AppDio.getDio();
    Map<String, dynamic> data = _getData(action.data);

    try {
      // 开始请求
      _next(next, action, HttpStatus.requesting);

      // 请求
      Response response = await dio.request(
        action.url,
        options: Options(method: _getMethod(action.method), headers: {'isLock': action.isLock}),
        data: action.method != HttpMethod.get ? data : null,
        queryParameters: action.method == HttpMethod.get ? data : null,
      );

      // 请求结果
      action.resultCode = response.data['code'];
      action.resultMessage = response.data['message'];
      action.result = response.data['data'];

      switch(response.data['code']) {
        // 成功
        case responseSuccessCode:
          _next(next, action, HttpStatus.success);
          break;
        // 无用户权限
        case responseNoPermissionCode:
          // TODO: action

          continue fail;
        fail:
        // 失败
        default:
          _next(next, action, HttpStatus.fail);
      }

      print(response);
    } on DioError catch (e) {
      print(e);
      switch(e.type) {
        // 超时
        case DioErrorType.CONNECT_TIMEOUT:
          continue timeout;
        case DioErrorType.SEND_TIMEOUT:
          continue timeout;
        timeout:
        case DioErrorType.RECEIVE_TIMEOUT:
          // TODO: action

          continue fail;
        // 关闭 (已被过滤?)
        case DioErrorType.CANCEL:
          // TODO: ...
          break;
        // 异常 TODO: 状态码
        case DioErrorType.RESPONSE:
          continue fail;
        fail:
        case DioErrorType.DEFAULT:
          _next(next, action, HttpStatus.fail);
          break;
      }
    } catch (e) {
      // 前端异常 TODO: log?...
      print(e);
    }
  }
}
