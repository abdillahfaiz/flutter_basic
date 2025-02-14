import 'package:flutter/widgets.dart';

class JajargenjangModel extends ChangeNotifier {
  int result = 0;

  void calculate(int alas, int tinggi) {
    result = alas * tinggi;
    notifyListeners();
  }
}
