import 'package:flutter/material.dart';
import 'screen.dart';

import '../route.dart' as appRoute;

class IndexRoute extends appRoute.Route<ScreenIndex> {
  IndexRoute(RouteSettings settings) : super(settings);

  @override
  ScreenIndex getScreen(RouteSettings settings) {
    ScreenIndex screen = ScreenIndex(arguments: settings.arguments);
    // TODO...

    return screen;
  }

  @override
  Route getRoute(ScreenIndex screen) {
    Route route = MaterialPageRoute(
      builder: (BuildContext context) => screen,
    );
    // TODO...

    return route;
  }

}
