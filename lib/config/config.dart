import 'local.dart';

class Config {
  // 是否为release版
  static const bool isRelease = bool.fromEnvironment('dart.vm.product');
  // server
  static const String server = isRelease
    // TODO
    ? 'http://127.0.0.1:3021'
    : LocalConfig.server;
  // response code: 成功 TODO
  static const int responseSuccessCode = 0;
  // response code: 无用户权限 TODO
  static const int responseNoPermissionCode = 10011002;
}
