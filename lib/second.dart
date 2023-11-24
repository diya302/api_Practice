import 'package:flutter/material.dart';
import 'package:practice2/list_provider.dart';
import 'package:provider/provider.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => NumbersListProvider(),
      child: Consumer<NumbersListProvider>(
          builder: (context, numbersProviderModel, Widget? child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              numbersProviderModel.add(); // int last = numbers.last;
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
                    scrollDirection: Axis.horizontal,
                    itemCount: numbersProviderModel.numbers.length,
                    itemBuilder: (context, index) {
                      return Text(
                        numbersProviderModel.numbers[index].toString(),
                        style: TextStyle(fontSize: 30),
                      );
                    }),
              )
            ],
          ),
        );
      }),
    );
  }
}
