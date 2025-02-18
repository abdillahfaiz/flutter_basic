import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:todo_list/data/model/product_detail_model.dart';

class ApiService {
  Future<Map<String, dynamic>> getData(int id) async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'));

    if (response.statusCode == 200) {
      print(jsonDecode(response.body)['title']);
    } else {
      print('Error');
    }

    return jsonDecode(response.body);
  }

  Future<List> getProdutcs() async {
    var response = await http.get(
      Uri.parse('https://api.escuelajs.co/api/v1/products'),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Either<String, List>> getUsers() async {
    try {
      var response =
          await http.get(Uri.parse('https://apiescuelajs.co/api/v1/usrs'));

      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        //? Succes Response
        return Right(data);
      } else {
        //! Error response
        return Left(data['message']);
      }
    } catch (e) {
      //! Undhandle Error
      return Left('Terjadi Kesalahan, Coba lagi');
    }
  }

  Future<Either<String, ProductDetail>> getProductDetail() async {
    try {
      var response =
          await http.get(Uri.parse('https://fakestoreapi.com/products/1'));

      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return Right(ProductDetail.fromJson(data));
      } else {
        return Left('Gagal Mengambil Data');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}

// Future<Either<String, List>> getUsers() async {
//     try {
//       var response =
//           await http.get(Uri.parse('https://api.escuelajs.co/api/v1/usrs'));

//       var responseData = jsonDecode(response.body);

//       if (response.statusCode == 200) {
//         return Right(responseData);
//       } else {
//         return Left(responseData['message']);
//       }
//     } catch (e) {
//       return Left(e.toString());
//     }
//   }
