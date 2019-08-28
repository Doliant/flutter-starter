import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../screens.dart';
import '../../store/store.dart';
import '../../store/state.dart' as appState;
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
    return StoreConnector<appState.State, appState.State>(
      converter: (store) => store.state,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Home_${state.home.testNum}'),
          ),
          body: renderBody(context, state),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              store.dispatch(HomeActionTestHttp(1));
              store.dispatch(HomeActionTestHttp(2));
//              store.dispatch(HomeActionTestHttp2('15908151525'));
              store.dispatch(HomeActionTest(2));

//              Navigator.pop(context);
//              Navigator.pushNamed(
//                context,
//                Screens.index,
//                arguments: <String, String>{
//                  'y': 'x',
//                },
//              );
//              setState(() {
//                num++;
//              });
            },
            tooltip: 'Increment',
            backgroundColor: Colors.black,
            child: Icon(Icons.adjust, color: Colors.white),
          ),
        );
      },
    );
  }

  Widget renderBody(BuildContext context, appState.State state) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Text(
          '${widget.state.testNum.toString()}..${store.state.home.testNum.toString()}..${state.home.testNum.toString()}',
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