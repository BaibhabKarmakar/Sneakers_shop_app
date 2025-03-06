import 'package:e_commerce_app/components/shoe_tile.dart';
import 'package:e_commerce_app/models/cart.dart';
import 'package:e_commerce_app/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // Add shoe to Cart :
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert the user that show are added successfully
    showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop(true); // Close the dialog after 3 seconds
        });
        return AlertDialog(
          title: Text("Successfully Added!"),
          content: Text("Check your Cart!"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder:
          (context, value, child) => Column(
            children: [
              // Search Bar :
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Search", style: TextStyle(color: Colors.grey[900])),
                    Icon(Icons.search, color: Colors.grey[700]),
                  ],
                ),
              ),

              // message :
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  "Everyone files... some fly longer than other!",
                  style: TextStyle(color: Colors.grey[700], fontSize: 17),
                ),
              ),

              // Hot picks :
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Hot Picks 🔥",
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              // Products :
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // create a shoe
                    Shoe shoe = value.getShoeList()[index];
                    return ShoeTile(
                      shoe: shoe,
                      onTap: () => addShoeToCart(shoe),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
                child: Divider(color: Colors.grey[100]),
              ),
            ],
          ),
    );
  }
}
