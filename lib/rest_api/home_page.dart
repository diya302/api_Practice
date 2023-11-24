import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class HomePageApi extends StatefulWidget {
  const HomePageApi({super.key});

  @override
  State<HomePageApi> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageApi> {
  List<PostModel> postlist = [];
  Future<List<PostModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // for (Map i in data) {
      //   postlist.add(PostModel.fromJson(i));
      // }
      postlist.clear();
      for (Map<String, dynamic> index in data) {
        postlist.add(PostModel.fromJson(index));
      }
      return postlist;
    } else {
      return postlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest API'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: postlist.length,
                        itemBuilder: (context, index) {
                          return Card(
                              child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'UserId: ${postlist[index].userId.toString()}'),
                                Text('Id: ${postlist[index].id.toString()}'),
                                Text(
                                  postlist[index].title.toString(),
                                  maxLines: 1,
                                ),
                                Text('Data: ${postlist[index].body.toString()}',
                                    maxLines: 1),
                              ],
                            ),
                          ));
                        });
                  } else {
                    return Text('!Loading');
                  }
                }),
          )
        ],
      ),
    );
  }
}
