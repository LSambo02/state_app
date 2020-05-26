import 'package:stateapp/managers/actions.dart';
import 'package:stateapp/models/app_state.dart';

//classe pra controlar o estado das nossas definições
// recebe o estado anterior
//reza a lenda que podemos recuperar alguns estados anteriores
// com recurso ao Redux
//recebe tambeém a ação que vai permitir trocar um estado e este é "armazenado"
AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);

  if (action is FontSize) {
    newState.sliderFontSize = action.payload;
  } else if (action is Bold) {
    newState.bold = action.payload;
  } else if (action is Italic) {
    newState.italic = action.payload;
  }

//retorna o novo estado de acordo com a acção que foi lançada
  return newState;
}
