import 'package:flutter/widgets.dart';
import 'package:kashh/screens/home/home.dart';
import 'package:kashh/screens/inventory/inventory.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  HomeScreen.routeName: (BuildContext context) => HomeScreen(),
  InventoryScreen.routeName: (BuildContext context) => InventoryScreen()
};
