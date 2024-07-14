import 'package:add_to_cart/product_screen.dart';
import 'package:add_to_cart/provider/cart_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CartNotifier>(create: (_) => CartNotifier())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductScreen(),
    ),
  ));
}
