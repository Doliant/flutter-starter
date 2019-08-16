import 'package:flutter/material.dart';

void main() {
  return runApp(Starter());
}

class Starter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return Page(title: 'Starter');
//    WidgetsApp MaterialApp CupertinoApp
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Starter',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Page(title: 'Starter'),
    );
  }
}

class Page extends StatefulWidget {
  final String title;

  Page({this.title}) : super();

  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Page> {
  void _onPress() {
    print(35);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: renderBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPress,
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
