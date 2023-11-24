import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_model.dart';

class ApiDataFetch extends StatefulWidget {
  const ApiDataFetch({super.key});

  @override
  State<ApiDataFetch> createState() => _ApiDataFetchState();
}

class _ApiDataFetchState extends State<ApiDataFetch> {
  List<First> first = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: first.length,
              itemBuilder: (context, index) => Container(
                height: 120,
                color: Colors.greenAccent,
                //padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('User id: ${first[index].userId}',
                        style: TextStyle(fontSize: 18)),
                    Text('Id: ${first[index].id}',
                        style: TextStyle(fontSize: 18)),
                    Text('Title: ${first[index].title}',
                        style: TextStyle(fontSize: 18)),
                    Text('Body: ${first[index].body}',
                        maxLines: 1, style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<List<First>> getData() async {
    final response = await http
        .get((Uri.parse('https://jsonplaceholder.typicode.com/posts')));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        first.add(First.fromJson(index));
      }
      return first;
    } else {
      return first;
    }
  }
}
