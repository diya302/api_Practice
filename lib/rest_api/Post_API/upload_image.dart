import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? image;
  File? uploadedImage;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future<void> getImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {
        showSpinner = false;
      });
    } else {
      print('No Image Selected');
      print('Try again');
      setState(() {
        showSpinner = false;
      });
    }
  }

  Future<void> uploadImage() async {
    setState(() {
      showSpinner = true;
    });
    var stream = http.ByteStream.fromBytes(image!.openRead() as List<int>);
    stream.cast();
    var length = await image!.length();
    var uri = Uri.parse('https://fakestoreapi.com/products');
    var request = new http.MultipartRequest('POST', uri);
    request.fields['title'] = 'Static title';
    var multiport = new http.MultipartFile('image', stream, length);
    request.files.add(multiport);
    var response = await request.send();
    print(response.stream.toString());
    if (response.statusCode == 200) {
      print('Image Uploaded Successfully');
    } else {
      print('Failed to Uploaded Image!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(title: Text('Image Upload')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                print('Select image');
                getImage();
              },
              child: Container(
                  child: image == null
                      ? Center(
                          child: Text('Pick Image'),
                        )
                      : Container(
                          child: Center(
                            child: Image.file(
                              image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                uploadImage();
              },
              child: Container(
                height: 50,
                width: 100,
                color: Colors.green,
                child: Center(child: Text('Upload')),
              ),
            ),
            if (uploadedImage != null)
              Image.file(
                uploadedImage!,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              )
          ],
        ),
      ),
    );
  }
}
