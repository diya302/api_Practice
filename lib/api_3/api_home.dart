import 'dart:convert';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiHomePage extends StatefulWidget {
  const ApiHomePage({super.key});

  @override
  State<ApiHomePage> createState() => _ApiHomePageState();
}

class _ApiHomePageState extends State<ApiHomePage> {
  Future<Map<String, dynamic>> fetchRandomVariable() async {
    final response = await http
        .get(Uri.parse('https://official-joke-api.appspot.com/random_joke'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to fetch data :) ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Random Joke'),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: fetchRandomVariable(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData) {
                return Text('No data available');
              } else {
                final joke = snapshot.data;
                final setup = joke?['setup'];
                final punchline = joke?['punchline'];
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FlipCard(
                        front: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text(
                                  '$setup',
                                  maxLines: 3,
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  textAlign: TextAlign.right,
                                  'Tap to see puch',
                                  maxLines: 3,
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                        back: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              '$punchline',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            fetchRandomVariable();
                          });
                        },
                        child: Text(
                          'Generate a Random Joke',
                          style: TextStyle(fontSize: 15),
                        ),
                        style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                      )
                    ],
                  ),
                );
              }
            }));
  }
}
//   if (snapshot.connectionState == ConnectionState.waiting) {
//     return CircularProgressIndicator();
//   }  if (snapshot.hasData) {
//     final joke = snapshot.data;
//     final setup = joke?['setup'];
//     final punchline = joke?['punchline'];
//     return Column(
//       children: [
//         FlipCard(
//           front: Card(
//               child: Padding(
//             padding: const EdgeInsets.all(10),
//             child: Text('$setup'),
//           )),
//           back: Text('$punchline'),
//         )
//       ],
//     );
//   }
// }));
