import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(ExpandableWidgetSample());
}

class ExpandableWidgetSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExpandableWidget(),
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ExpandableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expandable Sample"),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 600,
            color: Colors.amber,
            child: Text("column with 600 height - Main Axis Vertical"),
          ),
          // flexible and expandable both works are same as in functionlity, only diff is
          // flexible has property namely fit but expandable doesnt
          Flexible(
              fit: FlexFit.tight,
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: Text("column with 600 height - Main Axis Vertical"),
              )),
          Expanded(
              child: Container(
            width: double.infinity,
            color: Colors.grey,
            child: Text("column with 600 height - Main Axis Vertical"),
          ))
        ],
      ),
    );
  }
}
