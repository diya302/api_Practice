import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice2/rest_api/exam_3.dart';

class ExampleFour extends StatefulWidget {
  const ExampleFour({super.key});

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  var data;
  Future<void> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder(
              builder: (context, snapshot) {
                // if (snapshot?.connectionState == ConnectionState.waiting) {
                //   return Text('Loading');
                // } else {
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.blueGrey,
                        child: Column(
                          children: [
                            RowCustom(
                                title: 'Name: ',
                                value: data[index]['name'].toString()),
                            RowCustom(
                                title: 'Username: ',
                                value: data[index]['username'].toString()),
                            RowCustom(
                                title: 'Address: ',
                                value: data[index]['address']['street']
                                    .toString()),
                            RowCustom(
                                title: 'Geo: ',
                                value: data[index]['address']['geo']['lat']
                                    .toString()),
                          ],
                        ),
                      );
                    });
                // }
              },
              future: getUserApi(),
            )),
          ],
        ),
      ),
    );
  }
}
