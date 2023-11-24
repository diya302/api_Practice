import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'UserModel.dart';

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UserModel> usersList = [];
  Future<List<UserModel>> getUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        print(i['name']);
        usersList.add(UserModel.fromJson(i));
      }
      return usersList;
    } else {
      return usersList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.cyan, title: Text('Example Three')),
      body: Column(
        children: [
          Expanded(
            // flex: 1,
            child: FutureBuilder(
                future: getUsers(),
                builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                        itemCount: usersList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.cyan,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  RowCustom(
                                      title: 'Name: ',
                                      value: snapshot.data![index].name
                                          .toString()),
                                  RowCustom(
                                      title: 'UserName: ',
                                      value: snapshot.data![index].username
                                          .toString()),
                                  RowCustom(
                                      title: 'Email: ',
                                      value: snapshot.data![index].email
                                          .toString()),
                                  RowCustom(
                                      title: 'Address: ',
                                      value: snapshot.data![index].address.city
                                              .toString() +
                                          snapshot
                                              .data![index].address.street
                                              .toString() +
                                          snapshot.data![index].address.zipcode
                                              .toString() +
                                          snapshot.data![index].address.geo.lat
                                              .toString()),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class RowCustom extends StatelessWidget {
  String title, value;

  RowCustom({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 2, left: 10),
      child: Row(
        children: [
          Expanded(
              child: Text(title,
                  style: TextStyle(color: Colors.white, fontSize: 16))),
          Expanded(
              flex: 1,
              child: Text(
                value,
                style: TextStyle(color: Colors.white, fontSize: 15),
                maxLines: 2,
              )),
        ],
      ),
    );
  }
}

// class Users {
//   String id;
//   String name;
//   String username;
//   String email;
//   Users(
//       {required this.id,
//       required this.name,
//       required this.email,
//       required this.username});
// }
