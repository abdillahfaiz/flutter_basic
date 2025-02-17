import 'package:flutter/widgets.dart';
import 'package:todo_list/data/api_service.dart';
import 'package:todo_list/data/model/user_model.dart';

class UserProvider extends ChangeNotifier {
  List data = [];
  bool isLoading = false;
  String errorMessage = '';
  UserModel userData = UserModel();

  Future<void> getDataUser() async {
    isLoading = true;
    notifyListeners();

    try {
      //handle succes response
      data = await ApiService().getUsers();
    } catch (e) {
      // handle error response
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
