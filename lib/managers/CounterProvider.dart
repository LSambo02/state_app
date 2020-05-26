import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  //o contador é inicializado
  int _counter = 0;

  //método para diminuir o valor do contador
  subtract() {
    // só vai até zero, a redução
    if (counter > 0) _counter--;

    //o notifyListener serve para informar aos Consumers da mudança do valor (um listener)
    notifyListeners();
  }

  //método para adicionar o valor do contador
  add() {
    _counter++;

    notifyListeners();
  }

  //getter para obter o valor do contador
  int get counter => _counter;
}
