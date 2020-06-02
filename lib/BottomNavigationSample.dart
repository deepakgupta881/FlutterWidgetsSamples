import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavigationBarSample();
}

class BottomNavigationBarSample extends State<MyApp> {
  int _current = 0;

  // widgets
  final tabs = [
    Center(child: Text("Home")),
    Center(child: Text("Search")),
    Center(child: Text("Settings")),
    Center(child: Text("Contacts"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomNavigationBar"),
        centerTitle: true,
      ),
      body: tabs[_current],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.shifting,
        currentIndex: _current,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              backgroundColor: Colors.redAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text("Search"),
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("Settings"),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              title: Text("Contacts"),
              backgroundColor: Colors.amber),
        ],
        onTap: (value) {
          setState(() {
            _current = value;
          });
        },
      ),
    );
  }
}
