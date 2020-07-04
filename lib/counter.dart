import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int _counter1 = 0;
  int _counter2 = 0;

  int get counter1 => this._counter1;
  int get counter2 => this._counter2;

  setCounter1() {
    this._counter1++;
    debugPrint("set counter 1");
    notifyListeners();
  }

  setCounter2() {
    this._counter2++;
    debugPrint("set counter 2");
    notifyListeners();
  }
}
