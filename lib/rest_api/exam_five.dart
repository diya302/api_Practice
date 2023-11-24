import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice2/rest_api/ProductModel.dart';

class ExampleFive extends StatefulWidget {
  const ExampleFive({super.key});

  @override
  State<ExampleFive> createState() => _ExampleFiveState();
}

class _ExampleFiveState extends State<ExampleFive> {
  Future<ProductsModel> getProductApi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/d24f9761-dfba-4759-bcda-f42f3dd539b7'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductsModel.fromJson(json);
    } else {
      return ProductsModel.fromJson(json);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<ProductsModel>(
              future: getProductApi(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print('Success');
                  return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.3,

                            child: ListView.builder(
                                itemCount:
                                    snapshot.data!.data![index].images!.length,
                                itemBuilder: (context, position) {
                                  return Column(
                                    children: [
                                      ListTile(
                                        title: Text(snapshot
                                            .data!.data![index].shop!.name
                                            .toString()),
                                        subtitle: Text(snapshot
                                            .data!.data![index].shop!.shopemail
                                            .toString()),
                                        leading: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                snapshot.data!.data![index]
                                                    .shop!.image
                                                    .toString())),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.25,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(snapshot
                                                    .data!
                                                    .data![index]
                                                    .images![position]
                                                    .url
                                                    .toString()))),
                                      ),
                                      Icon((snapshot.data!.data![index]
                                                  .inWishlist! ==
                                              true
                                          ? Icons.favorite
                                          : Icons.favorite_border)),
                                    ],
                                  );
                                }),
                            //Text(index.toString()),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  print('failed :)');
                  return Text('Loading');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
