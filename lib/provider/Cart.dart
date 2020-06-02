import 'package:flutter/material.dart';
import 'package:google_sample/provider/CartModel.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cart",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Cart"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Center(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Long press to delete the cart item",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue),
                ),
              ),
            ),
            Consumer<CartModel>(
              builder: (context, value, child) {
                return Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                            onLongPress: () {
                              value.remove(
                                  value.selectedProducts.toList()[index]);
                            },
                            title: Text(
                              value.selectedProducts.toList()[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ));
                      },
                      separatorBuilder: (context, index) => Divider(
                            color: Colors.red,
                            thickness: 1,
                          ),
                      itemCount: value.selectedProducts.length),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
