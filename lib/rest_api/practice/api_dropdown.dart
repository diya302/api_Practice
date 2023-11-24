import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DropDownApi extends StatefulWidget {
  const DropDownApi({super.key});
  @override
  State<DropDownApi> createState() => _DropDownApiState();
}

class _DropDownApiState extends State<DropDownApi> {
  List<DropDownModel> data = [];
  Future<List<DropDownModel>> getPost() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    final body = jsonDecode(response.body) as List;
    if (response.statusCode == 200) {
      return body.map((e) {
        final map = e as Map<String, dynamic>;
        return DropDownModel(
          userId: map['userId'],
          id: map['id'],
          title: map['title'],
          body: map['body'],
        );
      }).toList();
    } else {
      throw Exception('Failed');
    }
  }

  var selectedvalue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<DropDownModel>>(
              future: getPost(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Center(
                    child: DropdownButton<String>(
                      hint: Text('Select Value'),
                      isExpanded: true,
                      value: selectedvalue,
                      items: snapshot.data?.map((e) {
                        return DropdownMenuItem<String>(
                          value: e.id.toString(),
                          child: Text(e.title.toString()),
                        );
                      }).toList(),
                      onChanged: (value) {
                        selectedvalue = value;
                        setState(() {});
                      },
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class DropDownModel {
  final String title;
  final String body;
  final int userId;
  final int id;

  DropDownModel(
      {required this.title,
      required this.body,
      required this.userId,
      required this.id});
}
