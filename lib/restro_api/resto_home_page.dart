import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class Api_1 extends StatefulWidget {
  const Api_1({super.key});

  @override
  State<Api_1> createState() => _Api_1State();
}

class _Api_1State extends State<Api_1> {
  Future<List<DataProduct>> dataProduct() async {
    final response =
        await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
    if (response.statusCode == 200) {
      var list = jsonDecode(response.body.toString());
      final List<DataProduct> dataProduct =
          list.map<DataProduct>((e) => DataProduct.fromJson(e)).toList();
      return dataProduct;
    } else {
      throw Exception('Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<DataProduct>>(
                  future: dataProduct(),
                  builder: (context, snapshot) {
                    List<DataProduct> dataProduct = snapshot.data!;
                    return ListView.builder(
                      itemCount: dataProduct.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Text(dataProduct[index].title.toString()),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: List.generate(
                                  dataProduct[index].images!.length,
                                  (imageIndex) => Image.network(
                                      dataProduct[index]
                                          .images![imageIndex]
                                          .toString(),
                                      height: 100,
                                      width: 100),
                                )),
                            Text(dataProduct[index].category!.name!.toString()),
                            Image.network(
                                dataProduct[index].category!.image!.toString(),
                                height: 100,
                                width: 100),
                            Text(dataProduct[index].description!.toString(),
                                maxLines: 1, overflow: TextOverflow.ellipsis),
                          ],
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
