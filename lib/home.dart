import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomePage extends StatefulWidget {
  static const bgColor = Color(0xFFfafafa);
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _editingController = TextEditingController(text: ' ');
  String? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Generate QR')),
      body: Container(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(contentPadding: EdgeInsets.all(10)),
              controller: _editingController,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  data = _editingController.text;
                });
              },
              child: Text('Genertare QR'),
            ),
            Center(
              child: QrImageView(
                data: '$data',
                version: QrVersions.auto,
                size: 200.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
