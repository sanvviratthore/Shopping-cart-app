import 'package:add_to_cart/cart_screen.dart';
import 'package:add_to_cart/data/product_data.dart';
import 'package:add_to_cart/provider/cart_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    var ob = Provider.of<CartNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.teal,
        leading: const Icon(
          Icons.balcony_outlined,
          size: 40,
          color: Colors.black,
        ),
        title: const Center(
          child: Text(
            "Aries Shopping",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(onPressed: (){
             Navigator.push(context,
             MaterialPageRoute(builder: (_)=> CartScreen()) 
             );
          }, icon:(
          Icon(
            Icons.shopping_cart_checkout,
            size: 40,
            color: Colors.black,
          ))),
        ],
      ),
      body: ListView.builder(
          itemCount: p_list.length,
          itemBuilder: (context, index) {
            return Card(
                child: Container(
                  decoration: BoxDecoration(
                    color: (index%2==0)?Color.fromARGB(255, 190, 255, 117):const Color.fromARGB(255, 208, 249, 162)
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.network(
                        "${p_list[index].p_img}",
                        height: 125,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text("${p_list[index].p_name}"),
                      Text("\u20B9\t${p_list[index].price}")
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          ob.addToCart(index);
                        },
                        child: const Icon(Icons.add_shopping_cart_rounded),
                      )
                    ],
                  )
                ],
              ),
            ));
          }),
    );
  }
}
