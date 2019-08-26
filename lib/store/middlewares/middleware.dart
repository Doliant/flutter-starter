import 'dart:io';

import 'package:dio/dio.dart';
import 'package:redux/redux.dart';

import '../state.dart';
import '../actions/action.dart';

abstract class HttpMiddleware<T extends Action> {
  // 当前未完成action
  List<T> actions;

  void httpMiddleware(Store<State> store, dynamic action, NextDispatcher next) {
    if (action is! T) return next(action);
    actions.add(action);

    handle(store, action, next, finish);
  }

  /**
   * 单一过滤
   */
  List<T> filterSingle(List<T> actions, T action);

  /**
   * 处理
   */
  void handle(Store<State> store, T action, NextDispatcher next, Function finish);

  /**
   * 完成
   */
  void finish(T action) {

  }

  /**
   * 是否已完成
   */
  bool isFinished(T action) {

  }
}

