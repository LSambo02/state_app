import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  subtract() {
    if (counter > 0) _counter--;

    notifyListeners();
  }

  add() {
    _counter++;

    notifyListeners();
  }

  int get counter => _counter;
}
