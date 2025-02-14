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
    var response =
        await http.get(Uri.parse('https://api.escuelajs.co/api/v1/users'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load users data");
    }
  }
}
