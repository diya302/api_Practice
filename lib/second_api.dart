import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/api_model2.dart';

class SecondApi extends StatefulWidget {
  const SecondApi({super.key});

  @override
  State<SecondApi> createState() => _SecondApiState();
}

class _SecondApiState extends State<SecondApi> {
  List<Second> second = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: second.length,
                itemBuilder: (context, index) => Container(
                    height: 200,
                    padding: EdgeInsets.all(10),
                    color: Colors.black12,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getText(index, 'ID: ', second[index].id.toString()),
                        getText(index, 'name: ', second[index].name.toString()),
                        getText(
                            index, 'Email: ', second[index].email.toString()),
                        getText(
                            index, 'Phone: ', second[index].phone.toString()),
                        getText(index, 'Website: ',
                            second[index].website.toString()),
                        getText(index, 'Company Name: ',
                            second[index].company.name.toString()),
                        getText(index, 'Address: ',
                            '${second[index].address.suite.toString()}, ${second[index].address.street.toString()}, ${second[index].address.city.toString()} - ${second[index].address.zipcode}'),
                      ],
                    )),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }

  Text getText(int index, String fieldName, String content) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: fieldName, style: TextStyle(color: Colors.blue, fontSize: 16)),
      TextSpan(
          text: content, style: TextStyle(color: Colors.black, fontSize: 16))
    ]));
  }

  Future<List<Second>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        second.add(Second.fromJson(index));
      }
      return second;
    } else {
      return second;
    }
  }
}
