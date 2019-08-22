import 'package:flutter/material.dart';
import 'screen.dart';

import '../route.dart';

class IndexRoute extends AbstractRoute<ScreenIndex> {
  IndexRoute(RouteSettings settings) : super(settings);

  @override
  ScreenIndex getScreen(RouteSettings settings) {
    ScreenIndex screen = ScreenIndex(arguments: settings.arguments);
    // todo...

    return screen;
  }

  @override
  Route getRoute(ScreenIndex screen) {
    Route route = MaterialPageRoute(
      builder: (BuildContext context) => screen,
    );
    // todo...

    return route;
  }

}
