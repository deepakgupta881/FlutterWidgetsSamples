import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      home: ListViewWidget(),
    );
  }
}

class ListViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListViewWidgetState();
}

class ListViewWidgetState extends State<ListViewWidget> {
  final List<String> fruits = [
    "Apple",
    "Banana",
    "Mango",
    "Papaya",
    "Cherry",
    "Donut",
    "Guava",
    "Berry",
    "Melon",
    "WaterMelon",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ListView Widget",
        ),
        centerTitle: true,
      ),
/*      body: ListView(
        children: <Widget>[
          Card(
              clipBehavior: Clip.hardEdge,
              elevation: 15,
              margin: EdgeInsets.all(5),
              child: ListTile(
                  title: Text(
                    "Mango",
                  ),
                  leading: Icon(Icons.search),
                  trailing: Icon(Icons.settings),
                  subtitle: Text("juicy fruit"),
                  onTap: () {
                    print("mango");
                  })),
          Card(
              clipBehavior: Clip.hardEdge,
              elevation: 5,
              margin: EdgeInsets.all(5),
              child: ListTile(
                  title: Text(
                    "Mango",
                  ),
                  leading: Icon(Icons.search),
                  trailing: Icon(Icons.settings),
                  subtitle: Text("juicy fruit"),
                  onTap: () {
                    print("mango");
                  })),
          Card(
              clipBehavior: Clip.hardEdge,
              elevation: 5,
              margin: EdgeInsets.all(5),
              child: ListTile(
                  title: Text(
                    "Mango",
                  ),
                  leading: Icon(Icons.search),
                  trailing: Icon(Icons.settings),
                  subtitle: Text("juicy fruit"),
                  onTap: () {
                    print("mango");
                  })),
        ],
      )*/
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            padding: EdgeInsets.all(5),
            itemBuilder: (context, index) => ListItems(this.fruits[index]),
            itemCount: this.fruits.length,
          ),
        ],
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  String name;

  ListItems(this.name);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Card(
        margin: EdgeInsets.all(5),
        elevation: 5,
        shadowColor: Colors.red,
        child: InkWell(
          onTap: () {
            print(name);
          },
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    child: Text(name[0].toUpperCase()),
                  ),
                  SizedBox(width: 10),
                  Text(
                    name,
                    style: TextStyle(fontSize: 20.0, color: Colors.blue),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
