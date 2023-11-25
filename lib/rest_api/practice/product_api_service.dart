import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practice2/rest_api/practice/product_model.dart';

class ProductApiService {
  static List<ProductApiList> product = [];
  static Future<List<ProductApiList>> productList() async {
    print('Fetching products');
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));

    print('Products fetched');

    if (response.statusCode == 200) {
      var list = jsonDecode(response.body.toString());
      // List<ProductApiList> product =
      //     list.map((e) => ProductApiList.fromJson(e)).toList();

      product = (list['products'] as List)
          .map((e) => ProductApiList.fromJson(e))
          .toList();
      return product;
    } else {
      print('Failed to fetch products');
      throw Exception('Failed to fetch products');
    }
  }

  static Future<ProductApiList> getProduct(String id) async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products/$id'));
    if (response.statusCode == 200) {
      var list = jsonDecode(response.body.toString());
      ProductApiList productApiList = ProductApiList.fromJson(list);
      print(response.body);
      return productApiList;
    } else {
      throw Exception('Failed');
    }
  }

  static Future<List<ProductApiList>> filterProduct(String search) async {
    final response = await http.get(
        Uri.parse('https://dummyjson.com/products/price/search?q=$search'));
    if (response.statusCode == 200) {
      var list = jsonDecode(response.body.toString());
      product = (list['products'] as List)
          .map((list) => ProductApiList.fromJson(list))
          .toList();
      print(response.body);
      return product;
    } else {
      throw Exception('Failed');
    }
  }
}
