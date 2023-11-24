import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'cart_model.dart';

class CartApiScreen extends StatefulWidget {
  const CartApiScreen({super.key});

  @override
  State<CartApiScreen> createState() => _CartApiScreenState();
}

class _CartApiScreenState extends State<CartApiScreen> {
  Future<List<Carts>> cartList() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/carts'));
    if (response.statusCode == 200) {
      print('Data Fetching');
      var list = jsonDecode(response.body.toString());
      List<Carts>? carts =
          (list['carts'] as List).map((e) => Carts.fromJson(e)).toList();
      print('Data Fetched');
      return carts;
    } else {
      print('Opps Data Not Found');
      throw Exception('Failed to Fetch Data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: FutureBuilder<List<Carts>>(
              future: cartList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  print('Error: ${snapshot.error}');
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  print('Data Fetched');
                  final carts = snapshot.data;

                  return ListView.builder(
                    itemCount: carts!.length,
                    itemBuilder: (context, index) {
                      final Carts cart = carts[index];

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cart.id.toString()),
                          Text(cart.total.toString()),
                          Text(cart.discountedTotal.toString()),
                          Column(
                            children: cart.products!.map((product) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.id?.toString() ??
                                      'ID not available'),
                                  Text(product.title ?? 'Title not available'),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    },
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
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import 'cart_model.dart';
//
// class CartApiScreen extends StatefulWidget {
//   const CartApiScreen({super.key});
//
//   @override
//   State<CartApiScreen> createState() => _CartApiScreenState();
// }
//
// class _CartApiScreenState extends State<CartApiScreen> {
//   Future<List<Carts>> cartList() async {
//     final response = await http.get(Uri.parse('https://dummyjson.com/carts'));
//     if (response.statusCode == 200) {
//       print('Data Fetching');
//       var list = jsonDecode(response.body.toString())['data']['products'];
//       List<Carts>? carts = (list['carts'][0]['products'] as List)
//           .map((e) => Carts.fromJson(e))
//           .toList();
//       print('Data Fetched');
//       return carts;
//     } else {
//       print('Opps Data Not Found');
//       throw Exception('Failed to Fetch Data');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Expanded(
//             child: FutureBuilder<List<Carts>>(
//               future: cartList(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (!snapshot.hasError) {
//                   print('Error');
//                   return Text('Error: ${snapshot.error}');
//                 } else {
//                   print('The Data will fetched soon');
//                   final carts = snapshot.data;
//                   return ListView.builder(
//                       itemCount: carts!.length,
//                       itemBuilder: (context, index) {
//                         print('The Data is Fetched');
//                         final Carts cart = carts[index];
//                         return Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(cart.id.toString()),
//                             Text(cart.total.toString()),
//                             Text(cart.discountedTotal.toString()),
//                             ListView.builder(
//                                 itemCount: cart.products!.length,
//                                 itemBuilder: (context, index) {
//                                   Products product = cart.products![index];
//                                   return Column(
//                                     children: [
//                                       Text(product.id.toString()),
//                                       Text(product.title.toString()),
//                                     ],
//                                   );
//                                 }),
//                           ],
//                         );
//                       });
//                 }
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
