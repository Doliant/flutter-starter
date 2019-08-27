import 'action.dart';

// http请求method
enum HttpMethod {
  post,
  get,
  put,
  delete,
}

// http请求状态
enum HttpStatus {
  // 正在请求
  requesting,
  // 请求成功
  success,
  // 请求失败
  fail,
}

// http请求Action
class HttpAction extends Action {
  // 是否单一 (比对data + url + method + args; 后于isSingle)
  bool isHttpSingle = false;
  // 是否持锁
  bool isLock = false;
  // 是否缓存
  bool isCache = false;
  // 是否离线操作
  bool isOffline = false;
  // 请求状态
  HttpStatus status;
  // URL
  String url;
  // method
  HttpMethod method = HttpMethod.post;
  // 参数数据
  dynamic args;
  // 请求结果数据
  dynamic result;
  // 请求结果状态码
  int resultCode;
  // 请求结果信息
  String resultMessage;
  /**
   * 开始请求回调
   * [HttpAction action]
   */
  ActionCallback<HttpAction> onRequesting;
  /**
   * 请求成功回调
   * [HttpAction action]
   */
  ActionCallback<HttpAction> onSuccess;
  /**
   * 请求失败回调
   * [HttpAction action]
   */
  ActionCallback<HttpAction> onFail;

  HttpAction({dynamic data, this.url, this.method}) : super(data: data);
}