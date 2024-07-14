import 'package:add_to_cart/provider/cart_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var cartNotifier = Provider.of<CartNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: const Icon(
          Icons.balcony_outlined,
          size: 40,
          color: Colors.black,
        ),
        title: const Center(
          child: Text(
            "My Cart Items",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 40,
              color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.lime,
      body: ListView.builder(
        itemCount: cartNotifier.cartList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cartNotifier.cartList[index].prod_name),
                    Text("Qty: ${cartNotifier.cartList[index].prod_qty}"),
                    Text("\u20B9 ${cartNotifier.cartList[index].prod_price}"),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        cartNotifier.incrementQuantity(index);
                      },
                      icon: const Icon(Icons.add),
                    ),
                    Text("Qty: ${cartNotifier.cartList[index].prod_qty}"),
                    IconButton(
                      onPressed: () {
                        cartNotifier.decrementQuantity(index);
                      },
                      icon: const Icon(Icons.remove),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
