import 'package:flutter/material.dart';
import 'package:kashh/models/cart.dart';
import 'package:kashh/models/inventory.dart';
import 'package:kashh/routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CartModel()), ChangeNotifierProvider(create: (context) => InventoryModel())],
      child: KashApp(),
    ));

class KashApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: routes);
  }
}
