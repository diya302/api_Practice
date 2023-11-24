import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice2/rest_api/practice/prac1_model.dart';

class PracApiScreen extends StatefulWidget {
  const PracApiScreen({super.key});
  @override
  State<PracApiScreen> createState() => _PracApiScreenState();
}

class _PracApiScreenState extends State<PracApiScreen> {
  //late Future<List<Album>> futureAlbum;

  Future<List<Album>> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    if (response.statusCode == 200) {
      List list = jsonDecode(response.body.toString());
      List<Album> albums = list.map((model) => Album.fromJson(model)).toList();
      return albums;
    } else {
      throw Exception('Failed to Load');
    }
  }

  @override
  void initState() {
    super.initState();
    // futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Album>>(
                future: fetchAlbum(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.all(5),
                        child: Card(
                          color: Colors.grey,
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Text(
                                      'UserId: ${snapshot.data![index].userId.toString()}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Text(
                                      'ID: ${snapshot.data![index].id.toString()}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Text(
                                      'About: ${snapshot.data![index].title}'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          )
        ],
      ),
    );
  }
}
