import 'package:flutter/material.dart';

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ShowFullImageSample(),
    );
  }
}

class ShowFullImageSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/back.jpg"), fit: BoxFit.fitHeight),
//              image: NetworkImage("https://i.picsum.photos/id/235/200/300.jpg"), fit: BoxFit.cover),
      )),
    );
  }
}
