import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_flipperkit/flutter_flipperkit.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'store/store.dart';

import 'screens/screens.dart';
import 'screens/index/screen.dart';

void main() {
  FlipperClient flipperClient = FlipperClient.getDefault();

  flipperClient.addPlugin(FlipperNetworkPlugin(
    // 如果你使用 http 库, 你必须把它设置为 false 且使用 https://pub.dev/packages/flipperkit_http_interceptor
    // useHttpOverrides: false,
    // 可选， 用于过滤请求
    filter: (HttpClientRequest request) {
      String url = '${request.uri}';
      if (url.startsWith('https://via.placeholder.com') ||
          url.startsWith('https://gravatar.com')) {
        return false;
      }
      return true;
    }));
  flipperClient.addPlugin(FlipperReduxInspectorPlugin());
  flipperClient.addPlugin(FlipperSharedPreferencesPlugin());
  flipperClient.start();

  return runApp(createApp());
}

Widget createApp() {
  return StoreProvider(
    store: store,
    child: MaterialApp(
      title: 'Starter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: ScreenIndex(),
//    initialRoute: Routes.index,
      onGenerateRoute: Screens().onGenerate,
    ),
  );
}
