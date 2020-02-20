import 'package:flutter/material.dart';
import 'package:kashh/enitity/product.dart';

class InventoryModel extends ChangeNotifier {
  final List<Product> products = dummyInventory;

  Product get(int pos) {
    return products[pos];
  }

}

List<Product> get dummyInventory => [
  Product("Autan Spray 200ml", 14000),
  Product("Belagio Man 200ml", 30000)
];