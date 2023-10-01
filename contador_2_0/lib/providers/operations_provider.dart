import 'package:flutter/material.dart';

class OperationsProvider with ChangeNotifier{
  int _counter = 0;

  int get counter => _counter;

  void add(){
    _counter++;
    notifyListeners();
  }

  void restart(){
    _counter = 0;
    notifyListeners();
  } 

  void subtract(){
    if(_counter > 0){
      _counter--;
      notifyListeners();
    }
  }

  void multiply2(){
    _counter *= 2;
    notifyListeners();
  } 

  void multiply3(){
    _counter *= 3;
    notifyListeners();
  } 

  void multiply5(){
    _counter *= 5;
    notifyListeners();
  } 

  bool isPrime(){
    if (_counter <= 1) {
    return false;
    }
    if (_counter <= 3) {
      return true;
    }
    if (_counter % 2 == 0 || _counter % 3 == 0) {
      return false;
    }
    int i = 5;
    while (i * i <= _counter) {
      if (_counter % i == 0 || _counter % (i + 2) == 0) {
        return false;
      }
      i += 6;
    }
    return true;
  }

  int getTenth(){
    return (_counter >= 100) ? 900 : _counter ~/ 10 * 100;
  }

}