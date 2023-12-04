// class GetApiService {
//   static List<Status> status = [];
//   static Future<List<Status>> statusList() async {
//     try {
//       final response = await http
//           .get(Uri.parse('https://dummy.restapiexample.com/api/v1/employees'));
//       if (response.statusCode == 200) {
//         print('Data fetching');
//         print(response.body);
//
//         var pasrseData = jsonDecode(response.body.toString());
//         if (pasrseData['status'] == 'success') {
//           status = (pasrseData['data'] as List)
//               .map((e) => Status.fromJson(e))
//               .toList();
//           return status;
//         } else {
//           return [];
//         }
//       } else {
//         print('oops');
//         throw Exception('Failed');
//       }
//     } on HttpException catch (e) {
//       print(e.message);
//       return [];
//     }
//   }
// }

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'get_api_model.dart';

class GetApiService {
  static Future<EntriesData> entriesList() async {
    final response = await http
        .get(Uri.parse('https://api.coindesk.com/v1/bpi/currentprice.json'));
    if (response.statusCode == 200) {
      var parseData = jsonDecode(response.body.toString());
      EntriesData entriesData = EntriesData.fromJson(parseData);
      return entriesData;
    } else {
      throw Exception('Error: ');
    }
  }

  Future<EntriesData> getEntriesList() async {
    final response = await http
        .get(Uri.parse('https://api.coindesk.com/v1/bpi/currentprice.json'));
    if (response.statusCode == 200) {
      var list = jsonDecode(response.body.toString());
      EntriesData entriesData = EntriesData.fromJson(list);
      return entriesData;
    } else {
      throw Exception('Error');
    }
  }
}

// class GetApiService {
//   static List<DataModel> data = [];
//   static Future<List<DataModel>> statusField() async {
//     try {
//       final response = await http
//           .get(Uri.parse('https://dummy.restapiexample.com/api/v1/employees'));
//       if (response.statusCode == 200) {
//         print('Data is fetching');
//         var parseData = jsonDecode(response.body.toString());
//         data = (parseData['data'] as List)
//             .map((e) => DataModel.fromJson(e))
//             .toList();
//         return data;
//       } else {
//         print('Failed');
//         throw Exception('Failed to Fetch. Status Code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error: $e');
//       throw Exception('Failed to Fetch. Error: $e');
//     }
//   }
//
//   static Future<DataModel> getApiData(String id) async {
//     final response = await http
//         .get(Uri.parse('https://dummy.restapiexample.com/api/v1/employee/1'));
//     if (response.statusCode == 200) {
//       var list = jsonDecode(response.body.toString());
//       DataModel productApiList = DataModel.fromJson(list);
//       print(response.body);
//       return productApiList;
//     } else {
//       print(response.body);
//       throw Exception('Failed');
//     }
//   }
// }
//code.pieces.app/install
