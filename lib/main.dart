import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_flipperkit/flutter_flipperkit.dart';
import 'package:fish_redux/fish_redux.dart';

import 'pages/test/page.dart';

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
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'test': TestPage(),
    },
  );

  return MaterialApp(
    title: "Test fish redux",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.black,
    ),
    //通过routes.buildPage的方式生成一个Widget
    home: routes.buildPage("test", null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}


class Starter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return Page(title: 'Starter');
//    WidgetsApp MaterialApp CupertinoApp
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Starter',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: BasePage(title: 'Starter'),
    );
  }
}

class BasePage extends StatefulWidget {
  final String title;

  BasePage({this.title}) : super();

  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<BasePage> {
  void _onPress() {
    print(35);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: renderBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPress,
        tooltip: 'Increment',
        backgroundColor: Colors.black,
        child: Icon(Icons.adjust, color: Colors.white),
      ),
    );
  }

  Widget renderBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Text(
          '...',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 32,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
