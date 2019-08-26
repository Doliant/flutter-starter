import 'package:flutter/material.dart' as flutter;

abstract class Route<T> {
  flutter.RouteSettings _settings;
  flutter.Route _route;
  T _screen;

  Route(this._settings) {
    _screen = getScreen(_settings);
    _route = getRoute(_screen);
  }

  flutter.RouteSettings get settings => _settings;
  flutter.Route get route => _route;
  T get screen => _screen;

  T getScreen(flutter.RouteSettings settings);

  flutter.Route getRoute(T screen);
}
