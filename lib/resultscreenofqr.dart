import 'package:flutter/material.dart';
import 'package:practice2/home.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomePage.bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'QR Scanner',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Text(
            'Scanned Result',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          SizedBox(height: 10),
          Text(
            'Result',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'COPY',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
