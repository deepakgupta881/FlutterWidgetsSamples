import 'dart:collection';

import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  Set<String> _selectedProducts = new HashSet();

  void add(String value) {
    _selectedProducts.add(value);
    /*Set<String> s = HashSet<String>();
    s.addAll(_selectedProducts);
    _selectedProducts = [];
    _selectedProducts.addAll(s);*/
    print(selectedProducts);
    notifyListeners();
  }

  void remove(String value) {
    _selectedProducts.remove(value);
    notifyListeners();
  }

  HashSet<String> get selectedProducts => _selectedProducts;
}
