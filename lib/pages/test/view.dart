import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(TestState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text('test'),
    ),
    body: _renderBody(state),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        dispatch(TestActionCreator.testAction());
//        dispatch(TestActionCreator.onTestAction());
      },
      tooltip: 'Increment',
      backgroundColor: Colors.black,
      child: Icon(Icons.adjust, color: Colors.white),
    ),
  );
}

Widget _renderBody(TestState state) {
  return Container(
    decoration: BoxDecoration(color: Colors.white),
    child: Center(
      child: Text(
        '${state.testNum}...',
//        '...',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 32,
          color: Colors.black87,
        ),
      ),
    ),
  );
}
