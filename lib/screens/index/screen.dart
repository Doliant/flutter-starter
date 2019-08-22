import 'package:flutter/material.dart';
import '../screens.dart';

class ScreenIndex extends StatefulWidget {
  Map<String, dynamic> arguments;
  ScreenIndex({Key key, Map<String, dynamic> this.arguments}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScreenIndex();
}

class _ScreenIndex extends State<ScreenIndex> {
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // todo
        title: Text('Index_${num}'),
      ),
      body: renderBody(context),
      floatingActionButton: FloatingActionButton(
        // todo
        onPressed: () {
          Navigator.pushNamed(
            context,
            Screens.home,
            arguments: <String, String>{
              'x': 'y',
            },
          );
          setState(() {
            num++;
          });
        },
        tooltip: 'Increment',
        backgroundColor: Colors.black,
        child: Icon(Icons.adjust, color: Colors.white),
      ),
    );
  }

  Widget renderBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Text(
          '...',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 32,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}