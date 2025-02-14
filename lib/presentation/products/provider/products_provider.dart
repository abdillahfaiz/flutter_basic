import 'package:flutter/widgets.dart';
import 'package:todo_list/data/api_service.dart';

class ProductsProvider extends ChangeNotifier {
  List data = [];
  bool isLoading = false;

  void getProducts() async {
    isLoading = true;
    notifyListeners();

    data = await ApiService().getProdutcs();
    isLoading = false;
    notifyListeners();
  }
}
