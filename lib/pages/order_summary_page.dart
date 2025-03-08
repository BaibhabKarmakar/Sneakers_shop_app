import 'package:e_commerce_app/models/cart.dart';
import 'package:e_commerce_app/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final List<Shoe> items = cart.getUserCart();
    final double totalPrice = items.fold(0 , (sum , item) => sum + int.parse(item.price));
    final double gst = totalPrice * 0.18;
    final double discount = totalPrice * 0.1;
    final double netAmount = totalPrice + gst - discount;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar : AppBar(
        backgroundColor : Colors.grey[500],
        title : Text("Order Summary"),
      ),
      body : Padding(
        padding: const EdgeInsets.all(20),
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children : [
            Text("Item Ordered : " , style : TextStyle(fontSize : 22 , fontWeight : FontWeight.bold)),
            const SizedBox(height : 10),
            Expanded(
              child : ListView.builder(
                itemCount : items.length,
                itemBuilder :(context, index) {
                  return ListTile(
                    title : Text(items[index].name),
                    trailing : Text("\$${items[index].price}"),
                  );
                },
              ),
            ),

            Divider(),
            Text("Total Price : \$${totalPrice.toStringAsFixed(2)}"),
            Text("GST (18%): \$${gst.toStringAsFixed(2)}"),
            Text("Discount (10%): -\$${discount.toStringAsFixed(2)}"),
            const SizedBox(height: 10),
            Text(
              "You have to pay : \$${netAmount.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ]
        )
      )
    );
  }
}