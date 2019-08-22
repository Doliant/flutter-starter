import 'package:flutter/material.dart';

import 'index/route.dart';
import 'home/route.dart';

class Screens {
  // index
  static const String index = '/';
  // home
  static const String home = '/home';

  Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      // index
      case index: return IndexRoute(settings).route;
      // home
      case home: return HomeRoute(settings).route;
    }
  }
}
