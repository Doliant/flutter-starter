import 'dart:io';

import 'package:dio/dio.dart';
import 'package:redux/redux.dart';

import '../state.dart';
import '../actions/action.dart';

/**
 * next
 * [return]: 是否已next
 */
typedef MiddlewareNext<T extends Action> = bool Function(T action, {ActionCallback<T> callback});

abstract class Middleware<T extends Action> {
  // 当前未完成action
  List<T> actions = [];

  void httpMiddleware(Store<State> store, dynamic originalAction, NextDispatcher next) {
    if (originalAction is! T) return next(originalAction);

    T action = originalAction;

    // 单一过滤
    _filterSingle(action);
    filterSingle(action);

    actions.add(action);

    handle(store, action, _next(next));
  }

  /**
   * 单一过滤
   */
  void _filterSingle(T action) {
    if (action.isSingle) {
      this.actions.removeWhere((itemAction) => itemAction.runtimeType == action.runtimeType && itemAction.isSingle);
    };
  }

  /**
   * next
   */
  MiddlewareNext<T> _next(NextDispatcher next) => (T action, {ActionCallback<T> callback}) {
    if (isFinished(action)) return false;

    next(action);
    if (callback != null) callback(action);
    return true;
  };

  /**
   * 自定义单一过滤
   */
  void filterSingle(T action) {}

  /**
   * 处理
   */
  void handle(Store<State> store, T action, MiddlewareNext<T> next);

  /**
   * 完成
   */
  void finish(T action) {
    this.actions.removeWhere((itemAction) => itemAction == action);
  }

  /**
   * 是否已完成
   */
  bool isFinished(T action) => actions.indexOf(action) == -1;
}

