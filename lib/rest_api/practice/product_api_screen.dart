import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice2/rest_api/practice/product_details_screen.dart';
import 'package:practice2/rest_api/practice/product_model.dart';
import 'package:shimmer/shimmer.dart';

class ProductApiScreen extends StatefulWidget {
  const ProductApiScreen({Key? key}) : super(key: key);

  @override
  State<ProductApiScreen> createState() => _ProductApiScreenState();
}

class _ProductApiScreenState extends State<ProductApiScreen> {
  Future<List<ProductApiList>> productList() async {
    print('Fetching products');
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    print('Products fetched');

    if (response.statusCode == 200) {
      var list = jsonDecode(response.body.toString());
      // List<ProductApiList> product =
      //     list.map((e) => ProductApiList.fromJson(e)).toList();

      List<ProductApiList> product = (list['products'] as List)
          .map((e) => ProductApiList.fromJson(e))
          .toList();
      return product;
    } else {
      print('Failed to fetch products');
      throw Exception('Failed to fetch products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product API'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<ProductApiList>>(
              future: productList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Shimmer.fromColors(
                        child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 200,
                                  width:
                                      MediaQuery.of(context).size.width * 5.5,
                                ),
                              );
                            }),
                        direction: ShimmerDirection.ltr,
                        period: Duration(seconds: 1),
                        baseColor: Colors.grey.shade700,
                        highlightColor: Colors.grey.shade100),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 5, left: 10, right: 10),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailScreen(
                                        productApiList: snapshot.data![index]),
                                  ));
                            },
                            child: Card(
                              elevation: 2,
                              color: Colors.indigo[200],
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        '${snapshot.data![index].title.toString()}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                    // Text(
                                    //     'Rating: ${snapshot.data![index].rating.toString()}'),

                                    // Text(
                                    //     'Stock: ${snapshot.data![index].stock.toString()}'),
                                    // Text(
                                    //     'Brand: ${snapshot.data![index].brand.toString()}'),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(top: 5),
                                    //   child: Text('Thumbnail:'),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(
                                    //       top: 5, bottom: 5, left: 2, right: 2),
                                    //   child: Image.network(
                                    //     snapshot.data![index].thumbnail
                                    //         .toString(),
                                    //     height: 100,
                                    //     width: 150,
                                    //   ),
                                    // ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //Text('Images:'),
                                          Row(
                                            children: List.generate(
                                                snapshot.data![index].images!
                                                    .length,
                                                (imageindex) => Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5,
                                                              bottom: 5,
                                                              left: 2,
                                                              right: 2),
                                                      child: Container(
                                                        height: 120,
                                                        width: 150,
                                                        decoration: BoxDecoration(
                                                            color: Colors.black,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            shape: BoxShape
                                                                .rectangle),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 3,
                                                                  horizontal:
                                                                      5),
                                                          child: Image.network(
                                                            fit:
                                                                BoxFit.fitWidth,
                                                            snapshot
                                                                .data![index]
                                                                .images![
                                                                    imageindex]
                                                                .toString(),
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                        'Price: ${snapshot.data![index].price.toString()}'),
                                    Text(
                                      'Category: ${snapshot.data![index].category.toString()}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(right: 10),
                                    //   child: Text(
                                    //     'Discription: ${snapshot.data![index].description.toString()}',
                                    //     overflow: TextOverflow.ellipsis,
                                    //     maxLines: 1,
                                    //   ),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(right: 10),
                                    //   child: Text(
                                    //     'Category: ${snapshot.data![index].category.toString()}',
                                    //     overflow: TextOverflow.ellipsis,
                                    //     maxLines: 1,
                                    //   ),
                                    // ),
                                    // Text(
                                    //     '${snapshot.data![index].discountPercentage.toString()} % off'),
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
          ),
        ],
      ),
    );
  }
}
