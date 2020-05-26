import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:stateapp/managers/CounterProvider.dart';
import 'package:stateapp/pages/Page2.dart';
import 'package:stateapp/pages/mobxCalculator.dart';

import 'managers/reducer.dart';
import 'models/app_state.dart';

void main() {
  final _initialState = AppState(sliderFontSize: 0.5);
  final Store<AppState> _store =
      Store<AppState>(reducer, initialState: _initialState);

  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  // O Store é de onde podemos recuperar e aceder ao estado
  // actual da aplicação e alterá-lo
  final Store<AppState> store;

  MyApp({this.store});
  @override
  Widget build(BuildContext context) {
//    O ChangeNotifierProvider assume a mudança quando o notifyListeners é
//     acionado, e só recebe quem tiver subscrito com um consumer
//    Podia ter sido usado também um MultiProvider, caso tivesse mas de um
//    provider para diferentes propositos
    return ChangeNotifierProvider<CounterProvider>(
      create: (context) => CounterProvider(),
//      Tudo em flutter é widget
//    Para que os widgets tenham acesso ao Store faz-se um "wrap"
//    com o StoreProvider que é um widget que deve estar acima do MaterialApp,
//    para que as mudanças abranjam toda a widget tree

      child: StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
//   O consumer permite ao builder como diz o nome consumir os dados do Provider

    return Consumer<CounterProvider>(
      builder: (context, _counterProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                    child: Text("Ir a calculadora"),
                    color: Colors.blue,
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MobxCalculator()))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
//                         A partir do builder é subscrito o respectivo
//                         Provider e é obtida sua instância e dado/função específica
                          _counterProvider.subtract();
                        }),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Tempo que falta pra acabar cornovirus: '),
                        Text(
                          _counterProvider.counter.toString(),
                          style: TextStyle(fontSize: 25),
                        )
                      ],
                    ),
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          _counterProvider.add();
                        })
                  ],
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              child: Text("GO"),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Covid()));
              }),
        );
      },
    );
  }
}
