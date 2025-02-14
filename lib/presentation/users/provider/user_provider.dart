import 'package:flutter/widgets.dart';
import 'package:todo_list/data/api_service.dart';

class UserProvider extends ChangeNotifier {
  List data = [];
  bool isLoading = false;

  void getDataUser() async {
    isLoading = true;
    notifyListeners();

    // panggil data dari API
    data = await ApiService().getUsers();

    isLoading = false;
    notifyListeners();
  }
}
