import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:stateapp/managers/CounterProvider.dart';
import 'package:stateapp/models/app_state.dart';
import 'package:stateapp/pages/settings.dart';

class Covid extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Covid();
  }
}

class _Covid extends State<Covid> {
  _Covid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page2"),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Settings();
                }));
              })
        ],
      ),
      body: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (context, state) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<CounterProvider>(
                  builder:
                      (BuildContext context, _counterProvider, Widget child) {
                    return Text(
                      _counterProvider.counter.toString(),
                      style: TextStyle(
                        fontSize: state.viewFontSize,
                        fontWeight:
                            state.bold ? FontWeight.w900 : FontWeight.normal,
                        fontStyle:
                            state.italic ? FontStyle.italic : FontStyle.normal,
                      ),
                    );
                  },
                ),
              ],
            ));
          }),
    );
  }
}
