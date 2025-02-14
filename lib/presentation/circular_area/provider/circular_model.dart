import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:todo_list/data/api_service.dart';

class CircularModel extends ChangeNotifier {
  double result = 0;
  Map<String, dynamic>? data;

  void calculate(double jariJari) {
    result = pi * jariJari * jariJari;
    notifyListeners();
  }

  void getData(int id) async {
    data = await ApiService().getData(id);
  }
}
