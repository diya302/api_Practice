import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice2/rest_api/practice/user_api_detail.dart';
import 'package:practice2/rest_api/practice/user_model.dart';

class UserApiScreen extends StatefulWidget {
  const UserApiScreen({super.key});

  @override
  State<UserApiScreen> createState() => _UserApiScreenState();
}

class _UserApiScreenState extends State<UserApiScreen> {
  Future<List<UserList2>> getUserData() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/users/search?q=John'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body.toString());
      final List<UserList2> userList =
          (data['users'] as List).map((e) => UserList2.fromJson(e)).toList();
      return userList;
    } else {
      throw Exception('Failed to Fetch');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<UserList2>>(
        future: getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserApiDetails(
                                  userListDetails: snapshot.data![index]),
                            ));
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Name: ${snapshot.data![index].firstName.toString()} ${snapshot.data![index].maidenName.toString()}'),
                              Center(
                                child: Image.network(
                                    snapshot.data![index].image.toString(),
                                    height: 100,
                                    width: 100),
                              ),
                              // Text(snapshot.data![index].gender.toString()),
                              // Text(snapshot.data![index].domain.toString()),
                              // Text(snapshot.data![index].university.toString()),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Text('Hair :- '),
                              //     Text(
                              //         ' Color: ${snapshot.data![index].hair!.color.toString()} ,'),
                              //     Text(
                              //         ' Type: ${snapshot.data![index].hair!.type.toString()}'),
                              //   ],
                              // ),

                              // Text(
                              //     '${snapshot.data![index].address!.address.toString()} ${snapshot.data![index].address!.city.toString()}')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
