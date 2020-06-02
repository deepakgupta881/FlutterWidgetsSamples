import 'package:flutter/material.dart';
import 'package:google_sample/provider/CartModel.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  final products = List<String>.generate(21, (index) {
    return "Product no. $index";
  });

  List<String> selectedProducts = List<String>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.all(2),
        itemBuilder: (context, index) {
          return Material(
            child: Card(
              elevation: 3,
              shadowColor: Colors.blue,
              child: InkWell(
                onTap: () {
                  Provider.of<CartModel>(context, listen: false)
                      .add(products[index]);
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
                          child: Text(products[index]
                              .substring(products[0].length - 1)
                              .toString()),
                        ),
                        SizedBox(width: 10),
                        Text(
                          products[index],
                          style: TextStyle(fontSize: 20.0, color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(
              color: Colors.blue,
              thickness: 1,
            ),
        itemCount: products.length);
  }
}
