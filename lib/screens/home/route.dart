import 'package:flutter/material.dart';
import 'screen.dart';

import '../route.dart' as appRoute;

class HomeRoute extends appRoute.Route<HomeScreen> {
  HomeRoute(RouteSettings settings) : super(settings);

  @override
  HomeScreen getScreen(RouteSettings settings) {
    HomeScreen screen = HomeScreen(arguments: settings.arguments);
    // todo...

    return screen;
  }

  @override
  Route getRoute(HomeScreen screen) {
    Route route = MaterialPageRoute(
      builder: (BuildContext context) => screen,
    );
    // todo...

    return route;
  }
}