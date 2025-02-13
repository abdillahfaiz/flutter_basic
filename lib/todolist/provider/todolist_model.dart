import 'package:flutter/material.dart';

class TodolistModel extends ChangeNotifier {
  List<String> todo = ['Dayat', 'Rafi'];

  void addData(String data) {
    todo.add(data);
    notifyListeners();
  }

  void removeData(int index) {
    todo.removeAt(index);
    notifyListeners();
  }
}
