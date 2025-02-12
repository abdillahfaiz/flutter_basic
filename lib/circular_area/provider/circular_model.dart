import 'dart:math';

import 'package:flutter/widgets.dart';

class CircularModel extends ChangeNotifier {

  double result = 0;


  void calculate(double jariJari) {
    result = pi * jariJari * jariJari;
    notifyListeners();
  }

}
