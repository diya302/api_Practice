import 'dart:convert';

import 'package:http/http.dart' as http;

import 'get_api_model.dart';

class GetApiService {
  List<Status> status = [];
  Future<List<Status>> statusList() async {
    final response = await http
        .get(Uri.parse('https://dummy.restapiexample.com/api/v1/employees'));
    if (response.statusCode == 200) {
      var list = jsonDecode(response.body.toString());
      status = (list['status'] as List).map((e) => Status.fromJson(e)).toList();
      return status;
    } else {
      throw Exception('Failed');
    }
  }
}
