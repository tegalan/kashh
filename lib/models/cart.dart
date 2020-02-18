import 'package:flutter/material.dart';
import 'package:kashh/enitity/product.dart';

class CartModel extends ChangeNotifier {
  final List<Product> _products = [];

  int get count => _products.length;


  int get totalPrice {
    int _total = 0;
    _products.forEach((product) => _total += product.price);
    return _total;
  }

  void add(Product product) {
    _products.add(product);
    print('Add product ${product.name} ${this.count}');
    notifyListeners();
  }

  Product get(int pos) {
    return _products[pos];
  }
}

