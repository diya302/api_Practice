import 'package:flutter/material.dart';
import 'package:practice2/rest_api/practice/product_details_screen.dart';

import 'get_api_model.dart';

class GetApiDetails extends StatefulWidget {
  final EntriesData dataModeldetails;
  const GetApiDetails({super.key, required this.dataModeldetails});

  @override
  State<GetApiDetails> createState() => _GetApiDetailsState();
}

class _GetApiDetailsState extends State<GetApiDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ReusableRow(
              title: 'Name: ',
              value: widget.dataModeldetails.time!.updated.toString(),
              maxline: 1),
          ReusableRow(
              title: 'Age: ',
              value: widget.dataModeldetails.disclaimer.toString(),
              maxline: 1),
          ReusableRow(
              title: 'Salary: ',
              value: widget.dataModeldetails.bpi!.uSD!.code.toString(),
              maxline: 1),
        ],
      ),
    );
  }
}
