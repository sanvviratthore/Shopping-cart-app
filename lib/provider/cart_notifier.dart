import 'package:add_to_cart/data/product_data.dart';
import 'package:add_to_cart/model/cart.dart';
import 'package:flutter/material.dart';

class CartNotifier extends ChangeNotifier{
  var cartList = [];

  addToCart(index){

    var item = p_list[index];
    int found=0;

    for(int i=0; i<cartList.length; i++){
       if(item.p_id == cartList[i].id){
        cartList[i].prod_qty++;
        cartList[i].prod_price = item.price*cartList[i].prod_qty;
        found=1;
        notifyListeners();
        break;
       }
       else{
        found=0;
       }
    }

    if(found == 0){
      cartList.add(Cart(item.p_id,item.p_name, 1, item.price));
      notifyListeners();
    }
  }

  void  incrementQuantity(int index) {
    cartList[index].prod_qty += 1;
    notifyListeners();
  }

  void decrementQuantity(int index) {
    if (cartList[index].prod_qty > 1) {
      cartList[index].prod_qty -= 1;
      notifyListeners();
    }
  }
}