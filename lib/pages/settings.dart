import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:stateapp/managers/actions.dart';
import 'package:stateapp/models/app_state.dart';

/// Alteração do estado Redux
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      //Aceder ao store e modificar o estado a partir do State
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Font Size: ${state.viewFontSize.toInt()}',
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline.fontSize),
                ),
              ),
              Slider(
                  min: 0.5,
                  value: state.sliderFontSize,
//                   Ao mover o slider, pegamos o valor do slider (acção),
//                   manda ao Reducer (AppState que depene do Objecto AppState)
//                  E é guardado o novo estado no store pronto pra reflectir através do StoreProvider
                  onChanged: (newValue) {
                    StoreProvider.of<AppState>(context)
                        .dispatch(FontSize(newValue));
                  }),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        value: state.bold,
                        onChanged: (newValue) {
                          try {
                            StoreProvider.of<AppState>(context)
                                .dispatch(Bold(newValue));
                          } catch (e) {
                            print(e);
                          }
                        }),
                    Text(
                      'Bold',
//                    reflectir a mudança de característica
                      style: getStyle(state.bold, false),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        value: state.italic,
                        onChanged: (newValue) {
                          StoreProvider.of<AppState>(context)
                              .dispatch(Italic(newValue));
                        }),
                    Text(
                      'Italic',
                      style: getStyle(false, state.italic),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  TextStyle getStyle([bool isBold = false, bool isItalic = false]) {
    return TextStyle(
      fontSize: 18,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    );
  }
}
