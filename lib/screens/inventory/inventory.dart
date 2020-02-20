import 'package:flutter/material.dart';
import 'package:kashh/enitity/product.dart';
import 'package:kashh/models/inventory.dart';
import 'package:provider/provider.dart';

class InventoryScreen extends StatelessWidget {
  static const String routeName = '/inventory';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory'),
      ),
      body: ListView(
          children: Provider.of<InventoryModel>(context, listen: true)
              .products
              .map((product) => InventoryItemWidget(product))
              .toList()),
    );
  }
}

class InventoryItemWidget extends StatelessWidget {
  final Product product;

  InventoryItemWidget(this.product);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Text(product.name),
          Text('${product.price}')
        ],)
      ],),
    );
  }
  
}
