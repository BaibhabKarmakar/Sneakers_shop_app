import 'package:flutter/material.dart';
import '../models/shoe.dart';

class ShoeTile extends StatelessWidget {
  Shoe shoe;
  void Function()? onTap;
  ShoeTile({super.key , required this.shoe , required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin :EdgeInsets.only(left : 25),
      width : 280,
      decoration: BoxDecoration(
        color : Colors.grey[200],
        borderRadius : BorderRadius.circular(12),
        

      ),
      child : Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children : [
          // Shoe pic 
          Container(
            height: 250, // you can adjust this
            width: double.infinity,
            child: Image.asset(shoe.imagePath , fit: BoxFit.cover)),
          // Description
          Padding(
            padding: const EdgeInsets.symmetric(vertical : 10 , horizontal : 20),
            child: Text(shoe.description , style : TextStyle(fontSize : 15 , color : Colors.grey[900])),
          ),
          // Price + Details : 
          Padding(
            padding: const EdgeInsets.only(left : 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children : [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children : [
                    // shoe name : 
                    Text(shoe.name , style : TextStyle(fontWeight : FontWeight.bold , fontSize : 20)),
                    const SizedBox(height : 5),
                    // Price : 
                    Text('\$${shoe.price}' , style : TextStyle(color : Colors.grey[800]))
                  ]
                ),
                // plus button : 
                GestureDetector(
                  onTap : onTap,
                  child: Container(
                    padding : EdgeInsets.all(20),
                    decoration : BoxDecoration(color : Colors.grey[900] , borderRadius: BorderRadius.only(topLeft: Radius.circular(12) , bottomRight: Radius.circular(12))),
                    child: Icon(Icons.add , color : Colors.grey[100],
                    )
                  ),
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}