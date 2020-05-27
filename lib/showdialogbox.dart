import 'package:flutter/cupertino.dart';
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
      home: ShowDialogBoxSample(),
    );
  }
}

class ShowDialogBoxSample extends StatelessWidget {
  Future<String> createDialog(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text("Enter your info"),
            elevation: 5,
            backgroundColor: Colors.amber,
            clipBehavior: Clip.hardEdge,
            content: TextField(
              decoration: InputDecoration(
                  hintText: "Enter your name",
                  errorMaxLines: 2,
                  icon: Icon(Icons.add),
                  hoverColor: Colors.red),
              controller: textEditingController,
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                    child: Center(child: Text("Submit")),
                    elevation: 5,
                    color: Colors.blue,
                    minWidth: 100,
                    onPressed: () {
                      Navigator.of(context)
                          .pop(textEditingController.text.toString());
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                    child: Center(child: Text("Cancel")),
                    elevation: 5,
                    minWidth: 100,
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ShowDialog Sample"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          onPressed: () {
            createDialog(context).then((value) {
              print(value);
              /*SnackBar snackbar = SnackBar(
                content: Text("ds"),
              );
              Scaffold.of(context).showSnackBar(snackbar);*/
            });
          },
          child: Text(
            "open Dialog",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.black,
          elevation: 5,
        ),
      ),
    );
  }
}
