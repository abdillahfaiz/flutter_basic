import 'dart:convert';

import 'package:http/http.dart' as http;

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

  Future<List> getUsers() async {
    try {
      //! Contoh testing succes response
      var response =
          await http.get(Uri.parse('https://api.escuelajs.co/api/v1/users'));

      //! Contoh testing error response yg menampilkan 404
      // var response =
      //     await http.get(Uri.parse('https://api.escuelajs.co/api/v1/use3s'));

      //! Contoh testing unhandle response dengan mengganti base url nya
      // var response =
      //     await http.get(Uri.parse('https://apiescuelajs.co/api/v1/usres'));

      //? Perkondisian jika response sukses
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        //! jika response error
        throw Exception(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      //! Revisi, cara pengambilan undhandle error nya seperti ini
      rethrow;
    }
  }
}
