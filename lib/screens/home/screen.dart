import 'package:flutter/material.dart';
import '../screens.dart';
import '../../store/store.dart';
import 'state.dart';
import 'action.dart';

class HomeScreen extends StatefulWidget {
  Map<String, dynamic> arguments;
  HomeState state = store.state.home;
  HomeScreen({Key key, Map<String, dynamic> this.arguments}) : super(key: key) {

  }

  @override
  State<StatefulWidget> createState() => _ScreenHome();
}

class _ScreenHome extends State<HomeScreen> {
  int num = 0;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // todo
        title: Text('Home_${widget.arguments['x']}_${num}'),
      ),
      body: renderBody(context),
      floatingActionButton: FloatingActionButton(
        // todo
        onPressed: () {
          store.dispatch(HomeActionTestHttp(1));
          store.dispatch(HomeActionTestHttp(2));
          store.dispatch(HomeActionTestHttp2(3));
//          store.dispatch(HomeActionTest(2));

//          Navigator.pop(context);
//          Navigator.pushNamed(
//            context,
//            Screens.index,
//            arguments: <String, String>{
//              'y': 'x',
//            },
//          );
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
          '${widget.state.testNum.toString()}..',
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