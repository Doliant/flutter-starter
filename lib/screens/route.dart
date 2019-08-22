import 'package:flutter/material.dart';

abstract class AbstractRoute<T> {
  RouteSettings _settings;
  Route _route;
  T _screen;

  AbstractRoute(this._settings) {
    _screen = getScreen(_settings);
    _route = getRoute(_screen);
  }

  RouteSettings get settings => _settings;
  Route get route => _route;
  T get screen => _screen;

  T getScreen(RouteSettings settings);

  Route getRoute(T screen);
}
