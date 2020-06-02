import 'package:flutter/material.dart';
import 'package:google_sample/provider/CartModel.dart';
import 'package:google_sample/provider/ProductList.dart';
import 'package:provider/provider.dart';

import 'Cart.dart';

void main() => runApp(
      ChangeNotifierProvider<CartModel>(
        child: MaterialApp(home: MyApp()),
        create: (context) => CartModel(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products App"),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Cart();
              }));
            },
          )
        ],
      ),
      body: ProductList(),
    );
  }
}
