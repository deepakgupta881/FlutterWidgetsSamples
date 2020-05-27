import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImagePickers(),
    );
  }
}

class ImagePickers extends StatefulWidget {
  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePickers> {
  File image;

  void openCamera() async {
    var imagePic = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      image = imagePic;
    });
  }

  void openGallery() async {
    var imagePic = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = imagePic;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Image Chooser",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                width: 200,
                child: image == null
                    ? Text(
                        "loading",
                        textAlign: TextAlign.center,
                      )
                    : Image.file(image),
              ),
              MaterialButton(
                child: Center(
                  child: Text("Open Camera",
                      style: TextStyle(color: Colors.white)),
                ),
                elevation: 5,
                color: Colors.blue,
                onPressed: () {
                  openCamera();
                },
              ),
              MaterialButton(
                child: Center(
                  child: Text(
                    "Open Gallery",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                elevation: 5,
                color: Colors.blue,
                onPressed: () {
                  openGallery();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
