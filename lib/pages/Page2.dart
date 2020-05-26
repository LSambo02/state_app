import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:stateapp/managers/CounterProvider.dart';
import 'package:stateapp/models/app_state.dart';
import 'package:stateapp/pages/settings.dart';

/// Aqui são verificadas as acções do Provider e Redux
///
///
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
//      para ter acesso ao estado do redux usa-se um StoreConnector
//      (lembrar que deve ter um StoreProvider bem no inicio da aplicacao)
//    -MaterialPage
//    O StoreConnector usa o contexto e o estado (state) que é retornado pelo tipo
//    que armazena no Store para determinado StoreConnector, daí se tem acesso
//    a todos os estados e basta usá-los a partir do state

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
//                        acessar o estado FontSize (retorna um double)
                        fontSize: state.viewFontSize,
                        fontWeight:
//                        acessar o estado FontWeight e FontStyle (retorna um bool)
//                        que permite fazer a comparação pra colocar a característica
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
