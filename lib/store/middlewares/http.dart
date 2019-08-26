import 'dart:io';

import 'package:dio/dio.dart';
import 'package:redux/redux.dart';

import '../state.dart';
import '../actions/http.dart';

// 获取http请求Dio
Dio _getDio() {
  Dio dio = Dio();

  // --- 默认配置 ---
  dio.options.contentType = ContentType.json;
  dio.options.responseType = ResponseType.json;
  // 基地址(server) todo
  dio.options.baseUrl = 'http://127.0.0.1:3021';

  return dio;
}

String _getMethod(HttpMethod method) {
  switch(method) {
    case HttpMethod.GET:
      return 'GET';
    case HttpMethod.POST:
      return 'POST';
    case HttpMethod.PUT:
      return 'PUT';
    case HttpMethod.DELETE:
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

void httpMiddleware(Store<State> store, dynamic originalAction, NextDispatcher next) async {
  if (originalAction is! HttpAction) return next(originalAction);
  HttpAction action = originalAction;

  // todo new
  Dio dio = _getDio();
  Map<String, dynamic> data = _getData(action.data);
  try {

  } on DioError catch (e) {

  }
  Response<Map<String, dynamic>> response = await dio.request(
    action.url,
    options: Options(method: _getMethod(action.method)),
    data: action.method != HttpMethod.GET ? data : null,
    queryParameters: action.method == HttpMethod.GET ? data : null,
  );

  print(_getData(action.data).toString());

  next(originalAction);
}
