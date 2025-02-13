import 'package:flutter/widgets.dart';

class RectangularModel extends ChangeNotifier {
  int result = 0;

  void calculate(int panjang, int lebar) {
    result = panjang * lebar;
    notifyListeners();
  }
}
