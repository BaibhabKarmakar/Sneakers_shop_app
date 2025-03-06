import 'package:e_commerce_app/components/cart_item.dart';
import 'package:e_commerce_app/models/cart.dart';
import 'package:e_commerce_app/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context , value , child) => Padding(
      padding: const EdgeInsets.symmetric(horizontal : 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children : [
          // Heading : 
          Text("My Cart" , style : TextStyle(fontWeight : FontWeight.bold , fontSize : 24)),
          const SizedBox(height : 10),

          Expanded(
            child : ListView.builder(
              itemCount: value.getUserCart().length,
              itemBuilder: (context , index) {
              // get individual Shoe : 
              Shoe individualShoe = value.getUserCart()[index];

              // return the cart item : 
              return CartItem(
                shoe : individualShoe,
              );
            })
          )
          
        ]
      ),
    ));
  }
}