// http请求状态
enum HttpStatus {
  // 正在请求
  requesting,
  // 请求成功
  success,
  // 请求失败
  fail,
}

// http请求method
enum HttpMethod {
  POST,
  GET,
  PUT,
  DELETE,
}

// Action
class Action {
  // 数据
  dynamic data;

  Action({
    this.data,

  });
}

// http正在请求回调
typedef void HttpRequestingCallback(HttpAction action);

// http请求成功回调
typedef void HttpSuccessCallback(HttpAction action);

// http请求失败回调
typedef void HttpFailCallback(HttpAction action);

// http请求Action
class HttpAction extends Action {
  // 请求状态
  HttpStatus httpStatus;
  // URL
  String url;
  // method
  HttpMethod method = HttpMethod.POST;
  // 参数数据
  dynamic args;
  // 请求结果数据
  dynamic result;
  // 请求结果状态码
  int resultCode;
  // 请求结果信息
  String resultMessage;
  // 正在请求回调
  HttpRequestingCallback requestingCallback;
  // 请求成功回调
  HttpSuccessCallback successCallback;
  // 请求失败回调
  HttpFailCallback failCallback;

  HttpAction({
    dynamic data,
    this.url,
    this.method,
  })
  : super(
    data: data,
  );
}

// socket请求Action todo
class SocketAction extends Action {

}