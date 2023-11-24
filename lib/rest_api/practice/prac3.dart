// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class Prac4Screen extends StatefulWidget {
//   const Prac4Screen({super.key});
//
//   @override
//   State<Prac4Screen> createState() => _Prac4ScreenState();
// }
//
// class _Prac4ScreenState extends State<Prac4Screen> {
//   List<DataModel> dataList = [];
//   late Future<List<DataModel>> futureList;
//   Future<List<DataModel>> getApi() async {
//     final response = await http.get(
//         Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=1'));
//     var data = jsonDecode(response.body.toString());
//     if (response.statusCode == 200) {
//       for (Map<String, dynamic> i in data) {
//         DataModel dataModel = DataModel(
//           postId: i['postId'],
//           id: i['id'],
//           name: i['name'],
//           email: i['email'],
//           body: i['body'],
//         );
//         dataList.add(dataModel);
//       }
//     } else {
//       throw Exception('Failed to load photos');
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     futureList = getApi() as Future<List<DataModel>>;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(),
//     );
//   }
// }
//
// class DataModel {
//   final int postId;
//   final int id;
//   final String name;
//   final String email;
//   final String body;
//
//   DataModel(
//       {required this.postId,
//       required this.id,
//       required this.name,
//       required this.email,
//       required this.body});
// }
