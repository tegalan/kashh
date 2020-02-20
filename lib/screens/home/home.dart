import 'package:flutter/material.dart';
import 'package:kashh/enitity/product.dart';
import 'package:kashh/helpers/format.dart';
import 'package:kashh/models/cart.dart';
import 'package:kashh/screens/inventory/inventory.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, InventoryScreen.routeName);
          },
          child: Icon(Icons.add),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 50.0),
          decoration: BoxDecoration(color: Colors.blue[400]),
          child: Column(
            children: <Widget>[
              HeaderWidget(),
              Expanded(child: ProductListWidget())
            ],
          ),
        ));
  }
}

class HeaderWidget extends StatelessWidget {
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '${formatRupiah.format(Provider.of<CartModel>(context, listen: true).totalPrice)}',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              padding: EdgeInsets.only(left: 20, right: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: <Widget>[
                  // Expanded(child: Text('Input or scan barcode')),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                      decoration: InputDecoration.collapsed(
                          hintText: 'Input or scan barcode'),
                    ),
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Icon(
                        Icons.photo_camera,
                        color: Colors.grey,
                      ),
                    ),
                    onTap: () => print(30000.toStringAsFixed(0)),
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Icon(
                        Icons.apps,
                        color: Colors.grey,
                      ),
                    ),
                    onTap: () => Provider.of<CartModel>(context, listen: false)
                        .add(Product('Test Product', 20000)),
                  )
                ],
              ),
            )
          ],
        ),
      );
}

class ProductListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Consumer<CartModel>(
        builder: (context, cart, child) => ListView.builder(
            itemCount: cart.count,
            itemBuilder: (context, index) {
              return ProductItemWidget(cart.get(index));
            }),
      ));
}

class ProductItemWidget extends StatelessWidget {
  final Product product;

  ProductItemWidget(this.product);

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                product.name,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Text('Rp.${product.price}'),
            Divider()
          ],
        )));
  }
}
