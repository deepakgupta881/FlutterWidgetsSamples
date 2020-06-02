import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  List<String> _selectedProducts = [];

  void add(String value) {
    _selectedProducts.add(value);
    notifyListeners();
  }

  void remove(String value) {
    _selectedProducts.remove(value);
    notifyListeners();
  }

  List<String> get selectedProducts => _selectedProducts;
}
