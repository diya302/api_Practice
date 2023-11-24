// https://reqres.in/api/register :: API Link

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign Up Api"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'Email')),
            SizedBox(height: 10),
            TextFormField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'Password')),
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                login(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    'Login',
                    style: TextStyle(fontSize: 15),
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}

void login(String email, String password) async {
  try {
    Response response =
        await post(Uri.parse('https://reqres.in/api/login'), body: {
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data['token']);
      print('Login Successfully');
    } else {
      print('Failed');
    }
  } catch (e) {
    print(e.toString());
  }
}
