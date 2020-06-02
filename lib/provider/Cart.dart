import 'package:flutter/material.dart';
import 'package:google_sample/provider/CartModel.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cart",
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
                child: Text("Cart Items"),
              ),
            ),
            Consumer<CartModel>(
              builder: (context, value, child) {
                return Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                            onTap: () {
                              value.remove(value.selectedProducts[index]);
                            },
                            title: Text(value.selectedProducts[index]));
                      },
                      separatorBuilder: (context, index) => Divider(),
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
