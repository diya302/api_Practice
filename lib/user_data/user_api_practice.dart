import 'package:flutter/material.dart';
import 'package:practice2/user_data/user_api.dart';
//import 'package:http/http.dart' as http;
import 'package:practice2/user_data/users.dart';

class ApiPractice extends StatefulWidget {
  const ApiPractice({super.key});

  @override
  State<ApiPractice> createState() => _ApiPracticeState();
}

class _ApiPracticeState extends State<ApiPractice> {
  List<User> users = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('API Call'),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            // final color =
            //     user.gender == 'male' ? Colors.teal : Colors.orange[300];
            return ListTile(
              //tileColor: color,
              subtitle: Text(user.fullName),
              title: Text(user.location.street.name),
            );
          }),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
