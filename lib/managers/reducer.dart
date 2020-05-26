import 'package:stateapp/managers/actions.dart';
import 'package:stateapp/models/app_state.dart';

AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);

  if (action is FontSize) {
    newState.sliderFontSize = action.payload;
  } else if (action is Bold) {
    newState.bold = action.payload;
  } else if (action is Italic) {
    newState.italic = action.payload;
  }

  return newState;
}
