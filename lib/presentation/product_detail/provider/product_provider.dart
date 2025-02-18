import 'package:flutter/widgets.dart';
import 'package:todo_list/data/api_service.dart';
import 'package:todo_list/data/model/product_detail_model.dart';

class ProductProvider extends ChangeNotifier {
  ProductDetail? data;
  bool isLoading = false;
  String errorMessage = '';

  Future<void> getProductDetail() async {
    isLoading = true;
    notifyListeners();

    var response = await ApiService().getProductDetail();

    if (response.isRight) {
      data = response.right;
    } else {
      errorMessage = response.left;
    }

    isLoading = false;
    notifyListeners();
  }
}
