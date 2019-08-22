import 'package:flutter/material.dart';
import 'screen.dart';

import '../route.dart';

class HomeRoute extends AbstractRoute<ScreenHome> {
  HomeRoute(RouteSettings settings) : super(settings);

  @override
  ScreenHome getScreen(RouteSettings settings) {
    ScreenHome screen = ScreenHome(arguments: settings.arguments);
    // todo...

    return screen;
  }

  @override
  Route getRoute(ScreenHome screen) {
    Route route = MaterialPageRoute(
      builder: (BuildContext context) => screen,
    );
    // todo...

    return route;
  }
}