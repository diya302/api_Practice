import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Prac2ApiScreen extends StatefulWidget {
  const Prac2ApiScreen({super.key});

  @override
  State<Prac2ApiScreen> createState() => _Prac2ApiScreenState();
}

class _Prac2ApiScreenState extends State<Prac2ApiScreen> {
  List<Product> productList = [];
  late Future<List<Product>> futureList;
  Future<List<Product>> getPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        Product product = Product(
            albumId: i['albumId'],
            title: i['title'],
            id: i['id'],
            url: i['url'],
            thumbnailUrl: i['thumbnailUrl']);
        productList.add(product);
      }
      return productList;
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  void initState() {
    super.initState();
    futureList = getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GET DATA"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Product>>(
                future: futureList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              snapshot.data![index].thumbnailUrl.toString()),
                        ),
                        title: Text(snapshot.data![index].title.toString(),
                            maxLines: 1),
                        subtitle: Text(snapshot.data![index].url.toString(),
                            maxLines: 1),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
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

class Product {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Product(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});
}
