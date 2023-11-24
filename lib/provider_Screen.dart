import 'package:flutter/material.dart';
import 'package:practice2/list_provider.dart';
import 'package:practice2/second.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({super.key});

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  //List<int> numbers = [0];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => NumbersListProvider(),
      child: Consumer<NumbersListProvider>(
        builder: (context, numbersProviderModel, child) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                numbersProviderModel.add(); // int last = numbers.last;
                // setState(() {
                //   numbers.add(last + 1);
                // });
              },
            ),
            appBar: AppBar(
              backgroundColor: Colors.blue,
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 0,
                  child: Text(
                    numbersProviderModel.numbers.last.toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: numbersProviderModel.numbers.length,
                      itemBuilder: (context, index) {
                        return Text(
                          numbersProviderModel.numbers[index].toString(),
                          style: TextStyle(fontSize: 30),
                        );
                      }),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Second(),
                          ));
                    },
                    child: Text('Next Page'))
              ],
            ),
          );
        },
      ),
    );
  }
}
