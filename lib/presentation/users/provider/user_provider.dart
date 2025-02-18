import 'package:flutter/widgets.dart';
import 'package:todo_list/data/api_service.dart';
import 'package:todo_list/data/model/user_model.dart';

class UserProvider extends ChangeNotifier {
  List data = [];
  bool isLoading = false;
  String errorMessage = '';

  Future<void> getDataUser() async {
    isLoading = true;
    notifyListeners();

    var response = await ApiService().getUsers();

    if (response.isRight) {
      data = response.right;
    } else {
      errorMessage = response.left;
    }

    isLoading = false;
    notifyListeners();
  }
}

// await ApiService().getUsers().then((res) {
//       if (res.isRight) {
//         data = res.right;
//       } else {
//         errorMessage = res.left;
//       }
//     });
