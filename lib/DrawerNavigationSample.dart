import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.purple),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DrawerNavigationSample();
}

class DrawerNavigationSample extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("DrawerNavigationSample"),
          centerTitle: true,
        ),
        body: Container(),
        drawer: Drawer(
          child: Container(
            color: Colors.black12,
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    child: Image(
                      image: AssetImage("assets/cars_icon.png"),
                    ),
                  ),
                  accountEmail: Text("881dg1993@gmail.com"),
                  accountName: Text(
                    "Deepak Gupta",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  otherAccountsPictures: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text("K"),
                    )
                  ],
                ),
                ListTile(
                  onTap: () {},
                  title: Text("Home",
                      style: TextStyle(fontSize: 15, color: Colors.purple)),
                  leading: Icon(Icons.home),
                ),
                ListTile(
                  onTap: () {},
                  title: Text("Search",
                      style: TextStyle(fontSize: 15, color: Colors.purple)),
                  leading: Icon(Icons.search),
                ),
                ListTile(
                  onTap: () {},
                  title: Text("Settings",
                      style: TextStyle(fontSize: 15, color: Colors.purple)),
                  leading: Icon(Icons.settings),
                ),
                ListTile(
                  onTap: () {},
                  title: Text("Home",
                      style: TextStyle(fontSize: 15, color: Colors.purple)),
                  leading: Icon(Icons.home),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        // open a new page

                      },
                    ));
                  },
                  title: Text("Profile",
                      style: TextStyle(fontSize: 15, color: Colors.green)),
                  leading: Icon(Icons.verified_user),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: Text("Close",
                      style: TextStyle(fontSize: 15, color: Colors.green)),
                  leading: Icon(Icons.close),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
